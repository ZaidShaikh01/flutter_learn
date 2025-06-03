import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF2F5FA),
      
      body: SafeArea(
        child: Column(
          children: [
            // TODO: App Bar will come here
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(child: Image.asset('assets/profile_icon.png')),
                  Text(
                    'Hello, Alpy',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          spreadRadius: 5,
                          offset: Offset(1, 1),
                          color: const Color.fromARGB(48, 68, 137, 255),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset('assets/Vector.png'),
                    ),
                  ),
                ],
              ),
            ),

            // Adding three containers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.search),

                            SizedBox(width: 5),
                            // Text
                            Text(
                              'Location',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Filter Icon
                        Icon(Icons.filter),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(width: 10),
                        Text(
                          'July 08 - July 15',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.people),
                            SizedBox(width: 10),
                            Text(
                              '2 Guests',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '- | +',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff18C0C1),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),

                    ),
                    onPressed: () {},
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            // TODO: This will be body with scrollable
            Expanded(
              child: Container(

                decoration: BoxDecoration(
                  color: Color(0xFFD2DBEA),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)),
                ),
                width: double.infinity,

                child: Center(
                  child: Column(
                    spacing: 20,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Image.asset('assets/Island.png'),
                      Text('Details', style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),
                      SizedBox(
                        width: 330,
                        child: Text('Thailand, one of Asia’s most popular travel destinations, has been badly git a pandemic-induced tourim slump, with about 200,00 arrivals last ye ...', style: TextStyle(color: Color(0xFF625B71)),),
                      ),
                      SizedBox(height: 10,),

                      Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF546A83),
                          elevation: 10,
                          child: SizedBox(
                            width: 330,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset('assets/Home.png'),
                                Image.asset('assets/Contacts.png')
                              ],
                            ),
                          ))

                ]),
                )
              )
            )
          ],
        ),
      ),
    );
  }
}
