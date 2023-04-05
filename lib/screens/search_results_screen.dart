import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
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
        // appBar: AppBar(
        //   title: TextField(
        //     autofocus: true,
        //     textInputAction: TextInputAction.search,
        //     decoration: InputDecoration(
        //       hintText: 'Search',
        //       border: InputBorder.none,
        //     ),
        //     onSubmitted: _search,
        //   ),
        // ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemCount: _searchResults.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: InkWell(
                  onTap: () {
                    // Handle onTap here
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.network(
                          _searchResults[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          _searchResults[index].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          _searchResults[index].subtitle,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            }));
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
