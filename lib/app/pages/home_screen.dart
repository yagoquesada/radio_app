import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/text_constants.dart';
import '../../core/data/models/radio_model.dart';
import '../../core/services/api_service.dart';

import '../widgets/empty_radio_list.dart';
import '../widgets/error_page.dart';
import '../widgets/loading_page.dart';
import '../widgets/radios_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<RadioModel> radios;
  final List<String> genres = YTextConstants.items;
  List<String> selectedGenres = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            YColors.secondary,
            YColors.primary,
            YColors.secondary,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              /// App Title
              Center(
                child: Text(
                  YTextConstants.title.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Spacer(),

              /// Title Genres List
              Text(
                YTextConstants.filter,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 14),

              /// Genres List
              SizedBox(
                height: 45,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: genres.map((genre) => _genresList(context, genre)).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              /// Radio stations List (Grid)
              Expanded(
                flex: 30,
                child: FutureBuilder<List<RadioModel>>(
                  future: ApiService.getRadios(),
                  builder: (context, snapshot) {
                    /// Error fetching stations
                    if (snapshot.hasError) return const ErrorPage();

                    /// Loading Stations
                    if (!snapshot.hasData) return const LoadingPage();

                    radios = snapshot.data!;

                    /// Filter Radio Stations
                    final filterRadios = radios.where((radio) {
                      return selectedGenres.isEmpty || selectedGenres.contains(radio.genre);
                    }).toList();

                    /// If filters don't show any radio station
                    if (filterRadios.isEmpty) return const EmptyRadioList();

                    /// Radio Stations List
                    return RadioList(filter: filterRadios);
                  },
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _genresList(BuildContext context, String genre) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: FilterChip(
          label: Text(genre),
          showCheckmark: false,
          backgroundColor: YColors.transparent,
          selectedColor: YColors.accent,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          side: BorderSide(
            style: selectedGenres.contains(genre) ? BorderStyle.none : BorderStyle.solid,
            color: YColors.white,
            width: 2,
          ),
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: selectedGenres.contains(genre) ? YColors.secondary : YColors.white),
          selected: selectedGenres.contains(genre),
          onSelected: (selected) {
            setState(
              () {
                if (selected) {
                  selectedGenres.add(genre);
                } else {
                  selectedGenres.remove(genre);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
