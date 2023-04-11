import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:halkut_demo1/constants/constants.dart';
import 'package:halkut_demo1/models/home_screen_model.dart';

import 'bottom_nav_bar.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  List<MyListModel> myListContent = List.from(MyListModel.myList1);
  List<PopularMoviesModel> popListContent =
      List.from(PopularMoviesModel.homeSlide2);
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppConstants.myListAppBarColor,
        title: const Text('My List'),
        titleTextStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppConstants.fontColor),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            myList(),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height - 24),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Recommended to Download',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height - 16),
            ),
            SizedBox(
              child: CarouselSlider(
                items: popListContent
                    .map(
                      (item) => recommendedMovies(context, item),
                    )
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 0.31,
                  initialPage: 0,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: _onItemTapped,
      ),
    );
  }

  Widget myList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          (MediaQuery.of(context).size.height - 390),
      child: Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemCount: myListContent.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height - 80),
                        width: MediaQuery.of(context).size.width -
                            (MediaQuery.of(context).size.width - 136),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              myListContent[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          (MediaQuery.of(context).size.width - 8),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            myListContent[index].title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height - 4),
                          ),
                          Text(
                            myListContent[index].description,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: AppConstants.fontColor.withOpacity(0.6)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height - 15),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(4, 2, 3, 2),
                                color: AppConstants.textButtonBackgroundColor,
                                child: Text(
                                  myListContent[index].resolution,
                                  style: const TextStyle(
                                      color: AppConstants.iconColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    (MediaQuery.of(context).size.width - 8),
                              ),
                              Text(
                                myListContent[index].year,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    (MediaQuery.of(context).size.width - 9),
                              ),
                              Text(
                                myListContent[index].age,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 16),
                    )
                  ],
                );
              })),
    );
  }
}

Widget recommendedMovies(BuildContext context, PopularMoviesModel item) {
  return SizedBox(
    height: MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.height - 194),
    width: MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width - 100),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            width: MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width - 100),
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height - 134),
            child: Stack(children: [
              Image.asset(item.image, fit: BoxFit.cover),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  margin: const EdgeInsets.only(left: 4, bottom: 4, right: 73),
                  padding: const EdgeInsets.fromLTRB(4, 2, 3, 2),
                  color: AppConstants.textButtonBackgroundColor,
                  child: Text(
                    item.resolution,
                    style: const TextStyle(
                        color: AppConstants.iconColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ]),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 4),
        ),
        Text(
          item.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4,
            right: 2,
          ),
          child: Text(
            item.description,
            overflow: TextOverflow.clip,
            maxLines: 2,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppConstants.fontColor.withOpacity(0.6)),
          ),
        ),
      ],
    ),
  );
}
