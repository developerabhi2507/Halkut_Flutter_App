import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:halkut_demo1/constants/constants.dart';

import '../models/home_screen_model.dart';
import 'bottom_nav_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchController;
  List<SearchResult> display_list = List.from(SearchResult.searchResult1);

  int _selectedIndex = 1;

  @override
  void initState() {
    // Initialize all controllers.
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose all controllers.
    _searchController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void updateList(String value) {
    SearchResult.searchResult1.clear();
    setState(() {
      display_list = SearchResult.searchResult1
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  // @override
  // Widget buildResults(BuildContext context) {
  //   List<String> matchQyery = [];
  //   for (var value in display_list) {
  //     if (value.title.toLowerCase().contains(value.title.toLowerCase())) {
  //       matchQyery.add(value.title);
  //     }
  //   }
  //   return searchResult();
  // }

  // void _search(String query) {
  //   SearchResult.searchResult1.clear();
  //   if (query.isNotEmpty) {
  //     for (final item in SearchResult.searchResult1) {
  //       if (item.title.toLowerCase().contains(query.toLowerCase())) {
  //         SearchResult.searchResult1.add(item);
  //       }
  //     }
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 11),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => updateList(value),
              // autofocus: true,
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: AppConstants.fontColor.withOpacity(0.7),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                  fillColor: AppConstants.fontColor.withOpacity(0.8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Search any movie, genre, or cast.',
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppConstants.fontColor.withOpacity(0.4)),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    size: 24,
                    color: AppConstants.fontColor.withOpacity(0.38),
                  )),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Expanded(
            child: display_list.isEmpty ? searchScreen() : searchResult(),
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          onTap: _onItemTapped,
        ));
  }

  Widget searchScreen() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height - 56),
          ),
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
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
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
                          enlargeStrategy: CenterPageEnlargeStrategy.height),
                      items: MayBeYouLikes.searchList1.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage(item.image),
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
    );
  }

  Widget searchResult() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 16),
        ),
        Text("Showing result of ‘${_searchController.text}’"),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 16),
        ),
        GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemCount: display_list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Handle onTap here
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 256),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            display_list[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            display_list[index].title,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppConstants.fontColor),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            display_list[index].description,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppConstants.fontColor.withOpacity(0.6),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}

// class SearchResultItem {
//   final String imageUrl;
//   final String title;
//   final String subtitle;

//   SearchResultItem({
//     required this.imageUrl,
//     required this.title,
//     required this.subtitle,
//   });
// }
