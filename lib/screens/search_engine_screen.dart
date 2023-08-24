import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test/controllers/search_engine_controller.dart';

class SearchEngineScreen extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Search',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              keyboardType: TextInputType.text,
              onChanged: (newKeyword) {
                movieController.keyword.value = newKeyword;
                movieController.fetchMovies();
              },
              decoration: const InputDecoration(
                  labelText: 'Search Movie Name',
                  labelStyle: TextStyle(fontSize: 30, color: Colors.black)),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (movieController.movies.isEmpty) {
                  return const Center(
                    child: Text(
                      'No movies found.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: movieController.movies.length,
                    itemBuilder: (context, index) {
                      final movie = movieController.movies[index];
                      return ListTile(
                        title: Text(movie.title),
                        subtitle: Text(movie.year),
                        leading: movie.poster != 'N/A'
                            ? Image.network(movie.poster)
                            : Icon(Icons.movie),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
