import 'dart:developer';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:test/models/search_engine_model.dart';

class MovieController extends GetxController {
  final keyword = ''.obs;
  final movies = <Movie>[].obs;

  void clearMovies() {
    movies.clear();
  }

  Future<void> fetchMovies() async {
    try {
      final response = await Dio().get(
          'http://www.omdbapi.com/?apikey=e9cc3386&type=movie&s=${keyword.value}');
      final data = response.data;
      log('Response Body: $data');
      if (data != null && data['Search'] != null) {
        if (data['Search'] is List) {
          final List<dynamic> searchData = data['Search'];
          movies.assignAll(searchData.map((json) => Movie.fromJson(json)));
        }
      } else {
        log('No movie data found in the response.');
        clearMovies();
      }
    } catch (error) {
      log('Error fetching movies: $error');
      clearMovies();
    }
  }
}
