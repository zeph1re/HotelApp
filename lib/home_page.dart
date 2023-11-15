import 'package:dicoding_assignment/detail_page.dart';
import 'package:flutter/material.dart';

import 'model/hotel_place.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Text("Search Your Best Hotel")),
            const SizedBox(height: 10),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: const TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration.collapsed(
                      hintText: "Enter Your Dream Hotel")),
            ),
            Container(
                padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  "Popular Hotels",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Expanded(
                child: GridView.builder(
              itemCount: hotelPlaceList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final HotelPlace hotel = hotelPlaceList[index];
                return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailPage(
                          place: hotel,
                        );
                      }));
                    },
                    child: Card(
                      elevation: 8,
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        // margin: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  image: DecorationImage(
                                      image: AssetImage(hotel.homeImage))),
                              // child: homeCardImage,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          hotelPlaceList[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        hotel.openTime,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    hotel.rating,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              },
            ))
          ],
        ),
      ),
    );
  }
}
