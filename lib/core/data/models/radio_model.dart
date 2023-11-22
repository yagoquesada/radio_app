class RadioModel {
  final String countryName;
  final String radioId;
  final String radioName;
  final String radioUrl;
  final String genre;

  RadioModel({
    required this.countryName,
    required this.radioId,
    required this.radioName,
    required this.radioUrl,
    required this.genre,
  });

  static RadioModel fromJson(Map<String, dynamic> json) => RadioModel(
        countryName: json['country_name'],
        radioId: json['radio_id'],
        radioName: json['radio_name'],
        radioUrl: json['radio_url'],
        genre: json['genre'],
      );

  Map<String, dynamic> toJson() => {
        'country_name': countryName,
        'radio_id': radioId,
        'radio_name': radioName,
        'radio_url': radioUrl,
        'genre': genre,
      };
}
