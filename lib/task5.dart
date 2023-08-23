import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class Task5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
            const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(width: 70),
                  Text(
                    "ANALYTICS",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                  SizedBox(width: 68),
                  Icon(
                    Icons.subject,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(left: 25),
                    child:  Text(
                      "KPI STATISTICS[%]",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 80),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      side: BorderSide(color: Colors.black12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Show More",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 90),

              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 60,
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
                              radius: 50,
                              backgroundColor: Color.fromARGB(255, 203, 107, 100),
                              child: Text(
                                '63',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    ),
                              )),
                        ),
                        const Positioned(
                          left: 30,
                          bottom: 80,
                          top: -50,
                          child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Color.fromARGB(255, 119, 150, 176),
                              child: Text(
                                '0.49',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                    
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: _buildKPIRow(
                            Colors.yellow,
                            "Gross Margin",
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15,left: 20),
                          child: _buildKPIRow(
                            Colors.red,
                            "CLR (Retention)",
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: _buildKPIRow(
                            Colors.blue,
                            "Churn Rate",
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              Row(
                children: [
                const  Padding(
                    padding:  EdgeInsets.only(left: 25),
                    child: Text(
                      "SALES REVENUE",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 120),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      side: BorderSide(color: Colors.black12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Monthly",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              Row(
                children: [
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  height: 200,
                  decoration: BoxDecoration(),
                  child: AspectRatio(
                    aspectRatio: 10 / 6,
                    child: DChartBarCustom(
                      showDomainLabel: true,
                      spaceBetweenItem: 15,
                      radiusBar: BorderRadius.circular(10),
                      listData: [
                        DChartBarDataCustom(
                            value: 10,
                            label: "Jan",
                            color: Colors.grey[300],
                            ),
                        DChartBarDataCustom(
                            value: 15,
                            label: "Feb",
                            color: Colors.grey[300],
                            ),
                        DChartBarDataCustom(
                            value: 22,
                            label: "Mar",
                            color: Colors.red[300],
                            ),
                        DChartBarDataCustom(
                            value: 18,
                            label: "Apr",
                            color: Colors.grey[300],
                            ),
                        DChartBarDataCustom(
                            value: 15,
                            label: "May",
                            color: Colors.grey[300],
                            ),
                        DChartBarDataCustom(
                            value: 20,
                            label: "Jun",
                            color: Colors.grey[300],
                            ),
                      ],
                    ),
                  ),
                ),
              ]),

              Padding(
                padding:  EdgeInsets.only(left: 30,top:70),
                child: Row(
                  children: [
                      Text(
                      "18K",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "Monthly ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                ),
                                ),
                        Text(
                          "Revenue ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                ),
                                ),
                      ],
                    ),

                    SizedBox(width: 40),

                    Container(
                      height: 40,
                      width: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12
                      ),
                    ),
                  
                      SizedBox(width: 40),

                    Row(
                      children:  [
                        Text(
                          "2%",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Revenue ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                    ),
                                    ),
                            Text(
                              "Growth ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                    ),
                                    ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: [
          _buildNavigationBarItem(
            icon: Icons.home,
            color: Colors.grey,
            ),
          _buildNavigationBarItem(
            icon: Icons.signal_cellular_alt,
            color: Colors.red,
            ),
          _buildNavigationBarItem(
            icon: Icons.settings,
            color: Colors.grey,
            ),
            _buildNavigationBarItem(
            icon: Icons.percent,
            color: Colors.grey,
            ),
        ],
      ),
    );
  }

  
  Widget _buildKPIRow(Color color, String label) {
    return Row(
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: color,
        ),
        const SizedBox(width: 5),
        Column(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

 
  BottomNavigationBarItem _buildNavigationBarItem({
    required IconData icon,
    required Color color,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: color,
      ),
      label: '',
      backgroundColor: Colors.grey[200],
    );
  }
}
