import 'package:challenge/controller/search_engine_controller.dart';
import 'package:challenge/model/search_engine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MovieSearchScreen extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Search App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              
              onChanged: (query) => movieController.searchMovies(query),
              
              decoration: InputDecoration(
                labelText: 'Search for movies',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Obx(() {
            if (movieController.isLoading.value) {
          
              return CircularProgressIndicator();
            } else if (movieController.movies.isEmpty) {
              return Text('No results');
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: movieController.movies.length,
                  itemBuilder: (context, index) {
                    final Movie movie = movieController.movies[index];
                    return ListTile(
                      leading: Image.network(movie.poster),
                      title: Text(movie.title),
                      subtitle: Text(movie.year),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
