import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halkut_demo1/constants/constants.dart';

import 'bottom_nav_bar.dart';
import 'home_screen.dart';
import 'search_results_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<SearchResultItem> _searchResults = [];
  final List<SearchResultItem> searchResults = [
    SearchResultItem(
      imageUrl: 'https://example.com/image1.jpg',
      title: 'Item 1',
      subtitle: 'Description for Item 1',
    ),
    SearchResultItem(
      imageUrl: 'https://example.com/image2.jpg',
      title: 'Item 2',
      subtitle: 'Description for Item 2',
    ),
    // Add more items here
  ];

  final List<String> _carouselItems = [
    'assets/images/maybe_you_likes1.png',
    'assets/images/maybe_you_likes2.png',
  ];
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _search(String query) {
    _searchResults.clear();
    if (query.isNotEmpty) {
      for (final item in searchResults) {
        if (item.title.toLowerCase().contains(query.toLowerCase())) {
          _searchResults.add(item);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 11),
            child: TextField(
              controller: _searchController,
              onSubmitted: _search,
              decoration: InputDecoration(
                fillColor: AppConstants.fontColor.withOpacity(0.8),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: 'Search any movie, genre, or cast.',
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.fontColor.withOpacity(0.4)),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  iconSize: 24,
                  color: AppConstants.fontColor.withOpacity(0.38),
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 56),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/search_bar_background.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width - 200),
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height - 200),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height - 32),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Search any Movie',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 8),
                    ),
                    Text(
                      'Explore our libraries and enjoy \n this movie with your family.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppConstants.fontColor.withOpacity(0.6)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 76),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 172),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Maybe You Likes',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height - 12),
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                                height: MediaQuery.of(context).size.height -
                                    (MediaQuery.of(context).size.height - 135),
                                viewportFraction: 0.7,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.height),
                            items: _carouselItems.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: AssetImage(item),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          onTap: _onItemTapped,
        ));
  }
}

class SearchResultItem {
  final String imageUrl;
  final String title;
  final String subtitle;

  SearchResultItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}
