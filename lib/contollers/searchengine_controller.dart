
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../models/searchengine_model.dart';



class EngineController extends GetxController {
  final String apiUrl = "http://www.omdbapi.com/?apikey=e9cc3386&type=movie";
  final RxBool isLoading = false.obs;
  final RxList<Movie> movies = RxList<Movie>([]);
  final Dio dio = Dio();

  String buildApiUrl(String query) {
    return "$apiUrl&s=${Uri.encodeComponent(query)}";
  }

  Future<void> moviesSearching(String query) async {
    isLoading.value = true;
    print("Searching for movies: $query");
    try {
      final response = await dio.get(buildApiUrl(query));
      print(buildApiUrl(query));
      print(response.data);

      final data = response.data;
      if (data['Response'] == "True") {
        final List<Movie> fetchedMovies = (data['Search'] as List)
            .map((movieData) => Movie.fromJson(movieData))
            .toList();
        movies.assignAll(fetchedMovies);
        print("Found ${fetchedMovies.length} movies.");
      }else {
        movies.clear();
      }
    } catch (e) {
      movies.clear();
      print("Error occurred: $e");
    }
    isLoading.value = false;
  }
}
