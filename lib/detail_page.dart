import 'package:flutter/material.dart';

import 'model/hotel_place.dart';

class DetailPage extends StatelessWidget {
  final HotelPlace place;

  const DetailPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var facilities = {
      "bed_icon.png": "Bed",
      "shower_icon.png": "Shower",
      "tv_icon.png": "TV",
      "wifi_icon.png": "WIFI",
    };

    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Image.asset(place.detailImage),
                  SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                  )),
                  Positioned(
                    top: 330,
                    child: Container(
                        height: 600,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(32),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  place.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Text(place.rating),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(place.location),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Facilities"),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 90,
                                width: double.maxFinite,
                                // decoration: BoxDecoration(color: Colors.red),
                                child: ListView.builder(
                                  itemCount: 4,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 63,
                                            height: 63,
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            decoration: BoxDecoration(
                                                // color: Colors.red,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 1,
                                                    blurRadius: 2,
                                                    offset: const Offset(0,
                                                        2), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "images/icons/${facilities.keys.elementAt(index)}"),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              facilities.values
                                                  .elementAt(index),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ]);
                                  },
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              place.description,
                              textAlign: TextAlign.justify,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
