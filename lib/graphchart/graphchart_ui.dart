import 'package:d_chart/d_chart.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GraphChartUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 236, 233, 1),
      bottomNavigationBar: BottomNavigationBar(

          // type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Color.fromRGBO(240, 236, 233, 1),
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.bar_chart,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.settings),
            ),
          ]),
      appBar: AppBar(
        // flexibleSpace: ,
        leading: Icon(Icons.arrow_back_ios),

        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "ANALYTICS",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'KPI STATISTICS[%]',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  OutlinedButton(
                    autofocus: false,
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      side: BorderSide(width: 1, color: Colors.grey),
                    ),
                    child: Text(
                      'See More',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.orange[300],
                      child: Text(
                        '84',
                        style: GoogleFonts.quicksand(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Positioned(
                      left: -40,
                      top: -35,
                      child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.deepOrange[400],
                          child: Text(
                            '63',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                    Positioned(
                      left: 30,
                      bottom: 80,
                      top: -50,
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color.fromARGB(255, 140, 181, 248),
                          child: Text(
                            '0.49',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.deepOrange,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Gross Margin',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle,
                              size: 10, color: Colors.deepOrange[400]),
                          SizedBox(width: 8),
                          Text(
                            'CLR(Retention)',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Color.fromARGB(255, 140, 181, 248),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Churn Rate',
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SALES REVENUE',
                    style: TextStyle(
                        color: Colors.black,
                         fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  OutlinedButton(
                    autofocus: false,
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      elevation: 0,
                      // fixedSize:Size(110,10) ,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      side: BorderSide(width: 1, color: Colors.grey),
                    ),
                    child: Text(
                      'Monthly',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 200,
                      //  width:300,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: AspectRatio(
                        aspectRatio: 10 / 6,
                        child: DChartBarCustom(
                            showDomainLabel: true,
                            spaceBetweenItem: 12,
                            radiusBar: BorderRadius.circular(12),
                            listData: [
                              DChartBarDataCustom(
                                value: 18,
                                label: 'Jan',
                                color: Colors.grey[350],
                              ),
                              DChartBarDataCustom(
                                  value: 22,
                                  label: 'Feb',
                                  color: Colors.grey[350]),
                              DChartBarDataCustom(
                                  value: 30,
                                  label: 'Mar',
                                  color: Colors.red[300]),
                              DChartBarDataCustom(
                                  value: 25,
                                  label: 'Apr',
                                  color: Colors.grey[350]),
                              DChartBarDataCustom(
                                  value: 18,
                                  label: 'May',
                                  color: Colors.grey[350]),
                              DChartBarDataCustom(
                                  value: 26,
                                  label: 'Jun',
                                  color: Colors.grey[350]),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      '18K',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'Monthly',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Revenue',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      color: Colors.grey,
                      width: 2,
                      height: 30,
                    ),
                    // VerticalDivider(
                    //   thickness: 3,
                    //   color: Colors.red,
                    // ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      '2%',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'Revenue',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Growth',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
