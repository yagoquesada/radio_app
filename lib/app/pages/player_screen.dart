// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:just_audio/just_audio.dart';
import 'package:radio_app/core/constants/text_constants.dart';
import 'package:radio_app/core/data/models/radio_model.dart';

import '../../core/constants/colors.dart';
import '../widgets/play_button.dart';
import '../widgets/player_buttons.dart';

class PlayerScreen extends StatefulWidget {
  PlayerScreen({super.key, required this.data, required this.index});

  final List<RadioModel> data;
  int index;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _init();

    // Play when screen is opened
    _player.play();
  }

  Future<void> _init() async {
    _player.playbackEventStream.listen(
      (event) {},
      onError: (
        Object e,
        StackTrace stackTrace,
      ) {
        log('A stream error occurred: $e');
      },
    );

    try {
      await _player.setUrl(widget.data[widget.index].radioUrl);
    } on PlayerException catch (e) {
      log("Error code: ${e.code}");
      log("Error message: ${e.message}");
    } on PlayerInterruptedException catch (e) {
      log("Connection aborted: ${e.message}");
    } catch (e) {
      log('An error occured: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      body: _body(context),
    );
  }

  /// App Bar
  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: const Text(YTextConstants.playing),
      backgroundColor: YColors.transparent,
    );
  }

  _body(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            YColors.secondary,
            YColors.primary,
            YColors.secondary,
          ],
          stops: [
            0.15,
            0.4,
            0.7,
          ],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              children: [
                const Spacer(),

                /// Genre Image
                Hero(
                  tag: widget.data[widget.index].radioId,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 3 / 5,
                    height: MediaQuery.of(context).size.width * 4 / 5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: _imageGenre(),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /// Song Name
                StreamBuilder<IcyMetadata?>(
                  stream: _player.icyMetadataStream,
                  builder: (context, snapshot) {
                    final metadata = snapshot.data;
                    final title = metadata?.info?.title ?? "...";
                    return Text(
                      title,
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    );
                  },
                ),

                /// Radio Country
                // Text(
                //   widget.data[widget.index].countryName,
                //   style: Theme.of(context).textTheme.labelLarge,
                //   textAlign: TextAlign.center,
                // ),
                // const SizedBox(height: 120),

                /// Radio Genre
                Text(
                  widget.data[widget.index].genre,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),

                /// Radio Name
                Text(
                  widget.data[widget.index].radioName,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                /// Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// Refresh Button
                    PlayerButtons(
                      icon: Icons.refresh,
                      onPress: () => _player.seek(Duration.zero),
                    ),

                    /// Previous Station Button
                    PlayerButtons(
                      icon: Icons.skip_previous_outlined,
                      onPress: () {
                        setState(() {
                          if (widget.index == 0) {
                            widget.index = widget.data.length - 1;
                          } else {
                            widget.index--;
                          }
                        });

                        // Stop revious radio
                        _player.stop();

                        // Set radio API URL
                        _player.setUrl(widget.data[widget.index].radioUrl);

                        // Play radio
                        _player.play();
                      },
                    ),

                    /// Pause/Play Button
                    StreamBuilder<PlayerState>(
                      stream: _player.playerStateStream,
                      builder: (context, snapshot) {
                        final playerState = snapshot.data;
                        final processingState = playerState?.processingState;
                        final playing = playerState?.playing;

                        if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
                          return Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: YColors.accent,
                              boxShadow: [
                                BoxShadow(
                                  color: YColors.accentOpaque,
                                  spreadRadius: 4,
                                  blurRadius: 8,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(9.0),
                              child: SpinKitCircle(
                                color: YColors.secondary,
                              ),
                            ),
                          );
                        } else if (playing != true) {
                          return PlayButton(
                            icon: Icons.play_arrow,
                            onPress: _player.play,
                          );
                        } else if (processingState != ProcessingState.completed) {
                          return PlayButton(
                            icon: Icons.pause,
                            onPress: _player.pause,
                          );
                        } else {
                          return PlayButton(
                            icon: Icons.replay,
                            onPress: () => _player.seek(Duration.zero),
                          );
                        }
                      },
                    ),

                    /// Next Station Button
                    PlayerButtons(
                      icon: Icons.skip_next_outlined,
                      onPress: () {
                        setState(() {
                          if (widget.index == widget.data.length - 1) {
                            widget.index = 0;
                          } else {
                            widget.index++;
                          }
                        });

                        // Stop revious radio
                        _player.stop();

                        // Set radio API URL
                        _player.setUrl(widget.data[widget.index].radioUrl);

                        // Play radio
                        _player.play();
                      },
                    ),

                    /// Volume Button
                    PlayerButtons(
                      icon: Icons.volume_up_outlined,
                      onPress: () => _showSliderDialog(
                        context: context,
                        title: "Adjust volume",
                        divisions: 10,
                        min: 0.0,
                        max: 1.0,
                        value: _player.volume,
                        stream: _player.volumeStream,
                        onChanged: _player.setVolume,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Set Image to each Genre
  ImageProvider<Object> _imageGenre() {
    return switch (widget.data[widget.index].genre) {
      "African" => const AssetImage('assets/img/african.jpg'),
      "Alternative" => const AssetImage('assets/img/alternative.jpg'),
      "Classical" => const AssetImage('assets/img/classical.jpg'),
      "Community" => const AssetImage('assets/img/community.jpg'),
      "Dance" => const AssetImage('assets/img/dance.jpg'),
      "Decades" => const AssetImage('assets/img/decades.jpg'),
      "Easy Listening" => const AssetImage('assets/img/easy_listening.jpg'),
      "Electronic" => const AssetImage('assets/img/electronical.jpg'),
      "Hip Hop" => const AssetImage('assets/img/hip_hop.jpg'),
      "Jazz" => const AssetImage('assets/img/jazz.jpg'),
      "Language" => const AssetImage('assets/img/language.jpg'),
      "Latin" => const AssetImage('assets/img/latin.jpg'),
      "None" => const AssetImage('assets/img/none.jpg'),
      "Other" => const AssetImage('assets/img/others.jpg'),
      "Pop" => const AssetImage('assets/img/pop.jpg'),
      "Religion" => const AssetImage('assets/img/religion.jpg'),
      "Rock" => const AssetImage('assets/img/rock.jpg'),
      "Talk" => const AssetImage('assets/img/talk.jpg'),
      "Theme" => const AssetImage('assets/img/theme.jpg'),
      "Transport" => const AssetImage('assets/img/transport.jpg'),
      _ => const AssetImage('assets/img/no_image.jpg')
    };
  }

  /// Volume Dialog
  void _showSliderDialog({
    required BuildContext context,
    required String title,
    required int divisions,
    required double min,
    required double max,
    required double value,
    required Stream<double> stream,
    required ValueChanged<double> onChanged,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: YColors.secondaryOpaque,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: YColors.white),
          textAlign: TextAlign.center,
        ),
        content: StreamBuilder<double>(
          stream: stream,
          builder: (context, snapshot) => SizedBox(
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${snapshot.data?.toStringAsFixed(1)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                Slider(
                  divisions: divisions,
                  min: min,
                  max: max,
                  value: snapshot.data ?? value,
                  onChanged: onChanged,
                  thumbColor: YColors.accent,
                  activeColor: YColors.accent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
