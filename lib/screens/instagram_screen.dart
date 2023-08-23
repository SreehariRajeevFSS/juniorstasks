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
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Image.network(
            "https://1000logos.net/wp-content/uploads/2017/02/Logo-Instagram.png",
            width: 150,
            scale: 3,
          ),
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
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
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: storiesController.imagesitems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage(
                                storiesController.imagesitems[index].imageUrl),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            storiesController.imagesitems[index].text,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 180),
                            child: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: NetworkImage(
                                storiesController.imagesitems[index].imageUrl,
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.favorite_outline_outlined,
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.message_rounded,
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.send,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 180),
                            child: Icon(
                              Icons.bookmark_border_rounded,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 200),
                        child: Text(
                          storiesController.imagesitems[index].comments,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ]),
                  );
                },
              ),
            ),
          ])),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              size: 30,
              color: Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              size: 30,
              color: Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
              color: Colors.black,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
