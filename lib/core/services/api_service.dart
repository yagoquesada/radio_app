import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../data/models/radio_model.dart';

class ApiService {
  static Future<List<RadioModel>> getRadios() async {
    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': apiHost,
        },
      );

      Map jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      dynamic jsonResponseStations = jsonResponse['stations'];

      if (response.statusCode != 200) {
        throw Exception("Can't fetch stations.");
      }

      List<RadioModel> radioList = [];

      if (jsonResponseStations.isNotEmpty) {
        radioList = List.generate(
          jsonResponseStations.length,
          (index) => RadioModel(
            countryName: jsonResponseStations[index]['country_name'],
            radioId: jsonResponseStations[index]['radio_id'],
            radioName: jsonResponseStations[index]['radio_name'],
            radioUrl: jsonResponseStations[index]['radio_url'],
            genre: jsonResponseStations[index]['genre'],
          ),
        );
      }

      return radioList;
    } on SocketException catch (_) {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}
