import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:d_chart/d_chart.dart';
import 'package:test/controllers/barchart_controller.dart';

class BarChartPage extends StatelessWidget {
  final controller = Get.put(BarChartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.arrow_back_ios),
                  Text(
                    "ANALYTICS",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.subject,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("KPI STATISTICS[%]",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {},
                      child: const Text(
                        "See More",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black87),
                      )),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.amber[200],
                          child: const Text(
                            '84',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        const Positioned(
                          left: -40,
                          top: -35,
                          child: CircleAvatar(
                              radius: 40,
                              backgroundColor:
                                  Color.fromARGB(255, 203, 107, 100),
                              child: Text(
                                '63',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        const Positioned(
                          left: 30,
                          bottom: 80,
                          top: -50,
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  Color.fromARGB(255, 119, 150, 176),
                              child: Text(
                                '0.49',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
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
                                color: Colors.red[300],
                              ),
                              SizedBox(width: 12),
                              const Text(
                                'Gross Margin',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.circle,
                                  size: 10, color: Colors.blue[300]),
                              SizedBox(width: 12),
                              const Text(
                                'CLR(Retention)',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.circle,
                                  size: 10, color: Colors.amber[300]),
                              SizedBox(width: 12),
                              const Text(
                                'Churn Rate',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("SALES REVENUE",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: const Text(
                      "Monthly",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 220,
                    decoration: BoxDecoration(),
                    child: AspectRatio(
                      aspectRatio: 11 / 7,
                      child: DChartBarCustom(
                        showDomainLabel: true,
                        spaceBetweenItem: 10,
                        radiusBar: BorderRadius.circular(10),
                        listData: [
                          DChartBarDataCustom(
                              value: 13, label: "Jan", color: Colors.grey[400]),
                          DChartBarDataCustom(
                              value: 18, label: "Feb", color: Colors.grey[400]),
                          DChartBarDataCustom(
                              value: 25, label: "Mar", color: Colors.red[300]),
                          DChartBarDataCustom(
                              value: 22, label: "Apr", color: Colors.grey[400]),
                          DChartBarDataCustom(
                              value: 20, label: "May", color: Colors.grey[400]),
                          DChartBarDataCustom(
                              value: 23, label: "Jun", color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Text(
                      "18K",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: const [
                        Text("Monthly ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87)),
                        Text("Revenue ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87)),
                      ],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      height: 35,
                      width: 2,
                      decoration: BoxDecoration(color: Colors.black12),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          "2%",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Column(
                          children: const [
                            Text("Revenue ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)),
                            Text("Growth ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 0,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                label: '',
                backgroundColor: Colors.grey[200]),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.bar_chart,
                  color: Colors.red,
                ),
                label: '',
                backgroundColor: Colors.grey[200]),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                label: '',
                backgroundColor: Colors.grey[200]),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                label: '',
                backgroundColor: Colors.grey[200]),
          ],
        ),
      ),
    );
  }
}
