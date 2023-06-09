import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halkut_demo1/screens/section_detail.dart';

import '../constants/constants.dart';
import 'package:halkut_demo1/models/home_screen_model.dart';

import 'bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController? _tabController;
  final List<Widget> _tabs = [
    const Tab(text: 'Featured'),
    const Tab(text: 'Series'),
    const Tab(text: 'Films'),
    const Tab(text: 'Originals'),
  ];

  final List<Widget> _bottomNavBarWidgets = [
    const Text('Home'),
    const Text('Search'),
    const Text('Folder'),
    const Text('More'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _carouselSliders = [
    CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16, left: 20, bottom: 16),
                child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Trending this week',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
              ),
              CarouselSlider(
                items: TrendingMoviesModel.homeSlide1
                    .map((trendingSlide) => TrandingCarouselCard(
                        trendingMoviesModel: trendingSlide))
                    .toList(),
                options: CarouselOptions(
                  height: 197,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // onPageChanged: (index, reason) {
                  //   setState(() {
                  //     _onItemTapped(_selectedIndex);
                  //   });
                  // },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 20, bottom: 16),
                child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Popular Movies',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
              ),
              SizedBox(
                child: CarouselSlider(
                  items: PopularMoviesModel.homeSlide2
                      .map((popularSlide) =>
                          PopularCarouselCard(popularMoviesModel: popularSlide))
                      .toList(),
                  options: CarouselOptions(
                    viewportFraction: 0.3,
                    initialPage: 0,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 20, bottom: 16),
                child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'New on Cinemas',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
              ),
              CarouselSlider(
                items: NewOnCinemaModel.homeSlide3
                    .map((newOnCinemaSlide) => NewOnCinemaCarouselCard(
                        newOnCinemaModel: newOnCinemaSlide))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 0.47,
                  initialPage: 0,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // onPageChanged: (index, reason) {
                  //   setState(() {
                  //     _onItemTapped(_selectedIndex);
                  //   });
                  // },
                ),
              ),
            ],
          ),
        )
      ],
    ),
    const Text('daat1'),
    const Text('daat1'),
    const Text('daat1'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [
                            AppConstants.iconBackgroundColor1,
                            AppConstants.iconBackgroundColor2
                          ],
                        )),
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 35),
                    width: MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width - 46.92),
                    child: FloatingActionButton.extended(
                      label: const Text(
                        'H',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.iconColor),
                      ),
                      backgroundColor: Colors.transparent,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 4.94),
                    child: AppConstants.title,
                  ),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      size: 18,
                      color: AppConstants.fontColor,
                    ))
              ],
            ),
            body: Column(
              children: [
                TabBar(
                  tabs: _tabs,
                  controller: _tabController,
                  isScrollable: true,
                  indicatorWeight: 4.33,
                  labelColor: AppConstants.textButtonBackgroundColor,
                  unselectedLabelColor: AppConstants.fontColor,
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 4.0,
                          color: AppConstants.textButtonBackgroundColor),
                      insets: EdgeInsets.symmetric(horizontal: 35.0)),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: _carouselSliders,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavBar(
              onTap: _onItemTapped,
            )));
  }
}

class TrandingCarouselCard extends StatelessWidget {
  const TrandingCarouselCard({
    super.key,
    required this.trendingMoviesModel,
  });
  final TrendingMoviesModel trendingMoviesModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(trendingMoviesModel.image,
                  fit: BoxFit.cover, width: 335),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    gradient: LinearGradient(
                      colors: [
                        AppConstants.homeSlide1Color,
                        AppConstants.homeSlide1Color.withOpacity(0.01)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 21.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trendingMoviesModel.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.fromLTRB(4, 2, 3, 2),
                              color: AppConstants.textButtonBackgroundColor,
                              child: Text(
                                trendingMoviesModel.resolution,
                                style: const TextStyle(
                                    color: AppConstants.iconColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text(
                              trendingMoviesModel.year,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Text(
                                trendingMoviesModel.age,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class PopularCarouselCard extends StatelessWidget {
  const PopularCarouselCard({
    super.key,
    required this.popularMoviesModel,
  });
  final PopularMoviesModel popularMoviesModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: SizedBox(
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
                  InkWell(
                      onTap: () {
                        Get.to(const SectionDetail());
                      },
                      child: Ink(
                          child: Image.asset(popularMoviesModel.image,
                              fit: BoxFit.cover))),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 4, bottom: 4, right: 73),
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
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height - 4),
            ),
            Text(
              popularMoviesModel.title,
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
                popularMoviesModel.description,
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
      ),
    );
  }
}

class NewOnCinemaCarouselCard extends StatelessWidget {
  const NewOnCinemaCarouselCard({
    super.key,
    required this.newOnCinemaModel,
  });
  final NewOnCinemaModel newOnCinemaModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 122),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width - 156),
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height - 88),
                  child: Image.asset(newOnCinemaModel.image, fit: BoxFit.cover),
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
                      newOnCinemaModel.resolution,
                      style: const TextStyle(
                          color: AppConstants.iconColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    newOnCinemaModel.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      newOnCinemaModel.description,
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
