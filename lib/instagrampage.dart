import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'instagramcontroller.dart';

class Instagram extends StatelessWidget {
  
  final StoriesController storiesController = Get.put(StoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
          elevation: 0,
          title:const Row(
            children: [
                Text(
                "Instagram",
                style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    ),
              ),
              SizedBox(width: 130),
              Icon(
              Icons.add_box_outlined,
              size: 25,
              color: Colors.black,
            ),
            SizedBox(
              width: 18,
            ),
            Icon(
              Icons.favorite_border_rounded,
              size: 25,
              color: Colors.black,
            ),
            SizedBox(
              width: 18,
            ),
            Icon(
              Icons.messenger_outline_sharp,
              size: 25,
              color: Colors.black,
            ),
            ],
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Obx (() =>
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:storiesController.storiesItems.length,
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
                                      storiesController.storiesItems[index].thumbnail),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                storiesController.storiesItems[index].title,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold,
                                      ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      );
                },
              ),
            ),
          ),
          const Divider(
            thickness: 0,
            color: Colors.grey,
          ),

          Expanded(
            child: ListView(
              children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRyBYgEF9oZKpnef-2FVKcgMM8U4EzT0M5xw&usqp=CAU'),
                  ),
              ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Pawan Kalyan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 165),
                    child: Icon(Icons.more_horiz)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          
                Container(
                color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbJ1baro-oZKpgjJmWBl4QXNsYDccmPqPmow&usqp=CAU',
            width: 390,
            height: 330,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Row(
              children: [
                Column(
                  children: [
              const  Padding(
                  padding:  EdgeInsets.only(left: 330,bottom: 190),
                  child: Text(
                    '3:14',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 330),
                  child: IconButton(
                        icon:const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                              ),
                              onPressed: () {
                                
                              },
                            ),
                ),
                  ],
                )
              ],
            ),
            
          ),
        ],
      ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.favorite,color: Colors.red,),
                
                  SizedBox(width: 15,),
                
                  Icon(Icons.comment_outlined),
                  
                  SizedBox(width: 15,),
                
                  Icon(Icons.send),
                
                  SizedBox(width: 260,),
                
                  Icon(Icons.bookmark_border_outlined),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                    '1000 likes',
                    style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),
                    ),
                    ],
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                    Text(
                    'hey guys subscribe my chanel',
                    style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),
                    ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                    'View all 15 comments',
                    ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXgUQkddg95hDkfCXUtT_yiXeN_ZxA_WqMjKafdgbdMxwFj8b-vv4J2JT6K75UaJ_OPrY&usqp=CAU'),
                  ),
              ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Chiranjeevi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 185),
                    child: Icon(Icons.more_horiz)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          
                Container(
                color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRdc6roTvvRljZfnp3CgDK6qjxEt7AWVyrkw&usqp=CAU',
            width: 390,
            height: 330,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Row(
              children: [
                Column(
                  children: [
              const  Padding(
                  padding:  EdgeInsets.only(left: 330,bottom: 190),
                  child: Text(
                    '2:10',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 330),
                  child: IconButton(
                        icon:const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                              ),
                              onPressed: () {
                                
                              },
                            ),
                ),
                  ],
                )
              ],
            ),
            
          ),
        ],
      ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.favorite,color: Colors.red,),
                
                  SizedBox(width: 15,),
                
                  Icon(Icons.comment_outlined),
                  
                  SizedBox(width: 15,),
                
                  Icon(Icons.send),
                
                  SizedBox(width: 260,),
                
                  Icon(Icons.bookmark_border_outlined),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                    '2000 likes',
                    style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),
                    ),
                    ],
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                    Text(
                    'hey guys subscribe my chanel',
                    style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),
                    ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                    'View all 30 comments',
                    ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8IrgcauRxlhlWBd20PTU9kxvpID4mP7mKpQ&usqp=CAU'),
                  ),
              ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Flowers",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 215),
                    child: Icon(Icons.more_horiz)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          
                Container(
                color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWC_PAHjlCkJ7foZb-GLuW9j_NvXp36bZTkg&usqp=CAU',
            width: 390,
            height: 330,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Row(
              children: [
                Column(
                  children: [
              const  Padding(
                  padding:  EdgeInsets.only(left: 330,bottom: 190),
                  child: Text(
                    '6:55',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 330),
                  child: IconButton(
                        icon:const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                              ),
                              onPressed: () {
                                
                              },
                            ),
                ),
                  ],
                )
              ],
            ),
            
          ),
        ],
      ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.favorite,color: Colors.red,),
                
                  SizedBox(width: 15,),
                
                  Icon(Icons.comment_outlined),
                  
                  SizedBox(width: 15,),
                
                  Icon(Icons.send),
                
                  SizedBox(width: 260,),
                
                  Icon(Icons.bookmark_border_outlined),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                    '1500 likes',
                    style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),
                    ),
                    ],
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                    Text(
                    'hey guys subscribe my chanel',
                    style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),
                    ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                    'View all 10 comments',
                    ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.favorite_outline_rounded,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: '',
            ),
          ],
      ),
    );
  }
}





