import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contollers/searchengine_controller.dart';

class EnginePage extends StatefulWidget {
  @override
  _EnginePageState createState() => _EnginePageState();
}

class _EnginePageState extends State<EnginePage> {
  final TextEditingController _searchController = TextEditingController();

  final EngineController _engineController = Get.put(EngineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Movies Searching',
            style: TextStyle(
              color: Colors.red
            ),
            ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter movie name',
                suffixIcon: IconButton(
                  icon:const Icon(Icons.search),
                  onPressed: () {
                    _engineController.moviesSearching(_searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _engineController.movies.length,
                itemBuilder: (context, index) {
                  final movie = _engineController.movies[index];
                  return ListTile(
                    title: Text(movie.title),
                    subtitle: Text(movie.year),
                    leading: Image.network(
                      movie.posterUrl,
                      width: 50,
                      height: 50,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                    ),
                    onTap: () {
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
