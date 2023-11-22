import 'package:flutter/material.dart';
import 'package:radio_app/app/pages/player_screen.dart';

import '../../core/constants/colors.dart';
import '../../core/data/models/radio_model.dart';

class RadioList extends StatelessWidget {
  const RadioList({
    super.key,
    required this.filter,
  });

  final List<RadioModel> filter;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: (MediaQuery.of(context).size.width / 2) / (MediaQuery.of(context).size.height / 3),
      ),
      itemCount: filter.length,
      itemBuilder: (context, index) {
        final filtered = filter[index];
        return _radioTile(context, index, filtered);
      },
    );
  }

  // Radio Tile inside GridView
  GestureDetector _radioTile(BuildContext context, int index, RadioModel filtered) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
            opacity: animation,
            child: PlayerScreen(
              data: filter,
              index: index,
            ),
          ),
        ),
      ),
      child: Hero(
        tag: filtered.radioId,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _imageGenre(index),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  YColors.transparent,
                  YColors.secondary,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    filtered.radioName,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    filtered.genre,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Set Image to each Genre
  ImageProvider<Object> _imageGenre(int index) {
    return switch (filter[index].genre) {
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
}
