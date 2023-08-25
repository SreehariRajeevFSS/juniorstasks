import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    size: 30,
                    Icons.add_box_outlined,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    size: 30,
                    Icons.favorite_border,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    size: 30,
                    Icons.chat_outlined,
                    color: Colors.black,
                  )),
            ],
          )
        ],
        title: SizedBox(
            height: 55,
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1280px-Instagram_logo.svg.png',
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.video_collection_outlined,
                color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.card_travel,
                color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
            ),
          ]),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Material(
                      shape: CircleBorder(
                          side: BorderSide(width: 3, color: Colors.green)),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?cs=srgb&dl=pexels-chloe-1043474.jpg&fm=jpg',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Your Story',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  children: [
                    Material(
                      shape: CircleBorder(
                          side: BorderSide(width: 3, color: Colors.red)),
                      child: CircleAvatar(
                        radius: 40,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?cs=srgb&dl=pexels-chloe-1043474.jpg&fm=jpg',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Channelnew...',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Material(
                      shape: CircleBorder(
                          side: BorderSide(width: 3, color: Colors.red)),
                      child: CircleAvatar(
                        radius: 40,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?cs=srgb&dl=pexels-chloe-1043474.jpg&fm=jpg',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'musicman_sa',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Material(
                      shape: CircleBorder(
                          side: BorderSide(width: 3, color: Colors.red)),
                      child: CircleAvatar(
                        radius: 40,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?cs=srgb&dl=pexels-chloe-1043474.jpg&fm=jpg',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'nytimes',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    Material(
                      shape: CircleBorder(
                          side: BorderSide(width: 3, color: Colors.red)),
                      child: CircleAvatar(
                        radius: 40,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?cs=srgb&dl=pexels-chloe-1043474.jpg&fm=jpg',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'nytimes',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0,
            color: Colors.grey,
          ),
          Expanded(
              child: ListView(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/wallpaper-with-floral-pattern-that-says-spring_1340-25738.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 220),
                child: Text('cearth',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15)),
              ),
              SizedBox(child: Icon(Icons.more_horiz))
            ]),
            Container(
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    'https://img.freepik.com/free-photo/wallpaper-with-floral-pattern-that-says-spring_1340-25738.jpg',

                    //  fit: BoxFit.cover,
                  ),
                  Positioned(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 330, bottom: 240),
                              child: Text(
                                '3:14',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "A lot of our invasive plant spacies\n               are pretty",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.volume_off_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 30),
                Icon(
                  Icons.comment_outlined,
                  size: 30,
                ),
                Icon(Icons.send, size: 30),
                SizedBox(
                  width: 220,
                ),
                Icon(Icons.bookmark_border_outlined, size: 30),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/wallpaper-with-floral-pattern-that-says-spring_1340-25738.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 220),
                child: Text('bbcearth',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15)),
              ),
              SizedBox(child: Icon(Icons.more_horiz))
            ]),
            Container(
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    'https://img.freepik.com/free-photo/wallpaper-with-floral-pattern-that-says-spring_1340-25738.jpg',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 330, bottom: 190),
                              child: Text(
                                '3:14',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "A lot of our invasive plant spacies\n              are pretty",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.volume_off_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 30),
                Icon(
                  Icons.comment_outlined,
                  size: 30,
                ),
                Icon(Icons.send, size: 30),
                SizedBox(
                  width: 220,
                ),
                Icon(Icons.bookmark_border_outlined, size: 30),
              ],
            ),
          ])),
        ]),
      ),
    );
  }
}
