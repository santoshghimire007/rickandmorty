import 'dart:convert';

import 'package:rick_morty_api/models/rick_morty_model.dart';
import 'package:http/http.dart' as http;

class RickMorty {
  Future<List<RickMortyModel>> fetchRickMortyData(page) async {
    final response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character?$page'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List<RickMortyModel> rmmodel = [];
      for (var item in result['results']) {
        rmmodel.add(RickMortyModel.fromJson(item));
      }
      return rmmodel;
    } else {
      throw Exception('Error');
    }
  }

  // Future<>
}
