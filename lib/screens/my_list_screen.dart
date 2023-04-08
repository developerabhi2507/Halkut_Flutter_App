import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:halkut_demo1/constants/constants.dart';
import 'package:halkut_demo1/models/home_screen_model.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.myListAppBarColor,
        title: const Text('My List'),
        titleTextStyle:
            const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
                children: MyListModel.myList1
                    .map((myList) => MyListMovies(
                          myListModel: myList,
                        ))
                    .toList(),
                ),
          ),
          Text(
            'Recommended to Download',
            style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
              CarouselSlider(
                items: PopularMoviesModel.homeSlide2
                    .map((recommendedMovies) =>
                        RecommendedMovies(popularMoviesModel: recommendedMovies))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 0.32,
                  initialPage: 0,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
        ],
      ),
    );
  }
}

class MyListMovies extends StatelessWidget {
  const MyListMovies({
    super.key,
    required this.myListModel,
  });
  final MyListModel myListModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 20, right: 20),
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height - 80),
            width: MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width - 136),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  myListModel.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width - 8),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myListModel.title,
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
                myListModel.description,
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
                      myListModel.resolution,
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
                      myListModel.year,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                    width: MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width - 9),
                    ),
                    Text(
                      myListModel.age,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

class RecommendedMovies extends StatelessWidget {
  const RecommendedMovies({
    super.key,
    required this.popularMoviesModel,
  });
  final PopularMoviesModel popularMoviesModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 202),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width - 100),
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height - 134),
                  child:
                      Image.asset(popularMoviesModel.image, fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 4, bottom: 4),
                    padding: const EdgeInsets.fromLTRB(4, 2, 3, 2),
                    color: AppConstants.textButtonBackgroundColor,
                    child: Text(
                      popularMoviesModel.resolution,
                      style: const TextStyle(
                          color: AppConstants.iconColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    popularMoviesModel.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 2),
                    child: Text(
                      popularMoviesModel.description,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
