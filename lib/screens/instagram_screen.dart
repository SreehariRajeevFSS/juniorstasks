import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controllers/stories_controller.dart';

class InstagramScreen extends StatelessWidget {
  InstagramScreen({super.key});
  final StoriesController storiesController = Get.put(StoriesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0,
        title: const Text(
          "Instagram",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.black),
        ),
        actions: const [
          Icon(
            Icons.outbox_sharp,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.message,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            height: 100,
            child: Obx(
              () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: storiesController.storiesItems.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey,
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(
                                      storiesController
                                          .storiesItems[index].thumbnail),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                storiesController.storiesItems[index].title,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    );
                  }),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            children: const [
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFu5ZInPRkgG_ryvofY5sdJbuZz-Fq6v071A&usqp=CAU'),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Jrntr",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 220),
                  child: Icon(Icons.more_horiz)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: storiesController.imagesitems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(storiesController
                                  .imagesitems[index].imageUrl),
                              fit: BoxFit.fill),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                storiesController.imagesitems[index].title,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Icon(Icons.music_off))
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
