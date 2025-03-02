import 'package:bucket_list/pages/addBucketList.dart';
import 'package:bucket_list/pages/mainscreen.dart';
import 'package:bucket_list/pages/transport.dart';
import 'package:bucket_list/pages/viewItem.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HotelSceen extends StatefulWidget {
  const HotelSceen({super.key});

  @override
  State<HotelSceen> createState() => _MainscreenState();
}

class _MainscreenState extends State<HotelSceen> {
  // we are using this list to get the json values

  List<dynamic> bucketListData = [];

  // We are using this for conditional loading

  bool isLoading = false;

  // THis to give try again

  bool isError = false;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    // Get data from the API using DIO
    // DIO USES RESPONSE KEYWORD SO THAT WE CCAN USE DATA IN THE RESPONSE
    // WE HAVE TO MAKE METHOD FUTURE AND ASYNC AND WE HAVE TO WAIT

    // Handle any error gracefully

    try {
      Response response = await Dio().get(
          "https://bucketlist-8a6cd-default-rtdb.firebaseio.com/hotellist.json");

      setState(() {
        // If the net is ther eand everything is right, But there are no values that is there is no data

        if (response.data is List) {
          bucketListData = response.data;
        } else {
          bucketListData = [];
        }
        isLoading = false;
        isError = false;
      });
    } catch (e) {
      isLoading = false;
      isError = true;
      setState(() {});
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         title: Text("URL INVALID"),
      //       );
      //     });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  Widget ListDataWidget() {
    // Only sending the map object where the map objected completed status is false

    List<dynamic> filteredList = bucketListData
        .where((element) => !(element?["completed"]) ?? false)
        .toList();
    return filteredList.length < 1
        ? Center(child: Text("No data on bucket list"))
        : ListView.builder(
            itemCount: bucketListData.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),

                // here we are checking whether the items that we are reciveing are items or not
                // if not we are catching the error if yes then we are displaying it

                child: (bucketListData[index] is Map &&
                        !(bucketListData[index]?["completed"] ?? false))
                    ? ListTile(
                        onTap: () {
                          // .Then is used to indicate that if the user has navigated back top the screen then do certain actions
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Viewitem(
                              index: index,
                              title: bucketListData[index]['item'] ?? "",
                              image: bucketListData[index]['image'] ?? "",
                              details: bucketListData[index]['details'] ?? "",
                            );
                          })).then((value) {
                            // Value that is passed we get here in the navigator.pop()
                            if (value == "referesh") {
                              getData();
                            }
                          });
                        },

                        // As this in JSON formate we are first accessing teh index then we are accessing the item
                        // If we dont have the key then we are providing the fallback value

                        // Using circle avtar insted of image to show image
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              // Accessing the image using json
                              // Added a null value exception to check if any error is encounterd
                              NetworkImage(
                                  bucketListData[index]?['image'] ?? ''),
                        ),
                        title: Text(
                          bucketListData[index]?['item'] ?? "",
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing:
                            // We have int vlaue we have to convert that into integer value
                            Text(
                          " \$ ${bucketListData[index]?['cost'].toString()}  ",
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    : SizedBox(),
                // Sized box without any parameter is invisible thing
              );
            });
  }

  Widget errorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning),
          Text("Error getting the data"),
          ElevatedButton(onPressed: getData, child: Text("Try again"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // DRawer starts here
      drawer: Drawer(
        backgroundColor: Colors.blueGrey[100],
        child: Column(
          children: [
            SizedBox(height: 200),
            Text(
              "Solapur Travels!",
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Mainscreen();
                }));
              },
              child: ListTile(
                leading: Icon(Icons.tour),
                title: Text("Places"),
                //trailing: Icon(Icons.arrow_back),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Transport();
                }));
              },
              child: ListTile(
                leading: Icon(Icons.train),
                title: Text("Transport"),
                //trailing: Icon(Icons.arrow_back),
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // NAvigator to go to another page
      //     // Using routing to navigate between pages

      //     //Navigator.pushNamed(context, "/add");

      //     Navigator.push(context, MaterialPageRoute(builder: (context) {
      //       return AddbucketlistScreen(
      //         newIndex: bucketListData.length,
      //       );
      //     }));
      //   },
      //   shape: CircleBorder(),
      //   child: Icon(Icons.add),
      // ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(onTap: getData, child: Icon(Icons.refresh)),
          )
        ],
        centerTitle: true,
        title: Text("Solapur Travels"),
      ),
      body: RefreshIndicator(
          onRefresh: getData,
          child: (isLoading)
              ? Center(child: CircularProgressIndicator())
              : isError
                  ? errorWidget()
                  : ListDataWidget()),
    );
  }
}
