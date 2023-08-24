import 'dart:developer';

import 'package:challenge/model/search_engine_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieController extends GetxController {
  final String apiUrl = "http://www.omdbapi.com/?apikey=e9cc3386&type=movie";

  final RxBool isLoading = false.obs;
  final RxList<Movie> movies = RxList<Movie>([]);

  void searchMovies(String query) async {
    isLoading.value = true;

    print("Searching for movies with query: $query");

    final response = await http.get(
      Uri.parse("$apiUrl&s=$query"),
     
    );
     print("$apiUrl&s=$query");
    
       log(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
     
      if (data['Response'] == "True") {
        final List<Movie> fetchedMovies = (data['Search'] as List)
            .map((movieData) => Movie.fromJson(movieData))
            .toList();

        movies.assignAll(fetchedMovies);
        print("Found ${fetchedMovies.length} movies.");
      } else {
        movies.clear();
        print("No movies found for query: $query");
      }
    } else {
      movies.clear();
      print("Failed to fetch data. Status code: ${response.statusCode}");
    }

    isLoading.value = false;
  }
}