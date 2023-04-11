import 'package:equatable/equatable.dart';

class TrendingMoviesModel extends Equatable {
  const TrendingMoviesModel(
      {required this.image,
      required this.title,
      required this.resolution,
      required this.year,
      required this.age});

  final String image;
  final String title;
  final String resolution;
  final String year;
  final String age;

  @override
  List<Object> get props => [image, title, resolution, year, age];

  static List<TrendingMoviesModel> homeSlide1 = [
    const TrendingMoviesModel(
        image: 'assets/images/carousel_slider_home1.png',
        title: 'Deuces',
        resolution: 'HD',
        year: '2018',
        age: '17+'),
    const TrendingMoviesModel(
        image: 'assets/images/carousel_slider_home2.png',
        title: 'Mom',
        resolution: 'HD',
        year: '2018',
        age: '13+'),
  ];

  @override
  bool get stringify => false;
}

class PopularMoviesModel extends Equatable {
  const PopularMoviesModel(
      {required this.image,
      required this.title,
      required this.resolution,
      required this.description});

  final String image;
  final String title;
  final String resolution;
  final String description;

  @override
  List<Object> get props => [image, title, resolution, description];

  static List<PopularMoviesModel> homeSlide2 = [
    const PopularMoviesModel(
        image: 'assets/images/popular_movies1.png',
        title: 'Crank - High Voltage',
        resolution: 'HD',
        description: 'a hit man wanting to go straight, lets his…'),
    const PopularMoviesModel(
        image: 'assets/images/popular_movies2.png',
        title: "Greta Gerwig’s Little Women",
        resolution: 'HD',
        description: '2019 American coming-of-age…'),
    const PopularMoviesModel(
        image: 'assets/images/popular_movies3.png',
        title: "Avengers - Dark Phoenix",
        resolution: 'HD',
        description: 'The X-Men face their most…'),
    const PopularMoviesModel(
        image: 'assets/images/popular_movies4.png',
        title: "007 - No Time To Die",
        resolution: 'HD',
        description: 'Recruited to rescue a kidnapped…'),
    const PopularMoviesModel(
        image: 'assets/images/popular_movies5.png',
        title: "Movie Title Write here",
        resolution: 'HD',
        description: 'Movie Description Write Here…'),
    const PopularMoviesModel(
        image: 'assets/images/popular_movies6.png',
        title: "Movie Title Write here",
        resolution: 'HD',
        description: 'Movie Description Write Here…'),
    const PopularMoviesModel(
        image: 'assets/images/popular_movies7.png',
        title: "Parasite",
        resolution: 'HD',
        description:
            'When the world is under attack from creatures who hunt their human prey by sound, a teenager who lost her hearing at 13, and her family, seek safety in a remote refuge. However, they discover a cult who are eager to exploit her heightened senses.'),
  ];

  @override
  bool get stringify => false;
}

class NewOnCinemaModel extends Equatable {
  const NewOnCinemaModel(
      {required this.image,
      required this.title,
      required this.resolution,
      required this.description});

  final String image;
  final String title;
  final String resolution;
  final String description;

  @override
  List<Object> get props => [image, title, resolution, description];

  static List<NewOnCinemaModel> homeSlide3 = [
    const NewOnCinemaModel(
        image: 'assets/images/new_on_cinema1.png',
        title: 'Empire',
        resolution: 'HD',
        description: 'Movie Description Write Here…'),
    const NewOnCinemaModel(
        image: 'assets/images/new_on_cinema2.png',
        title: "1917",
        resolution: 'HD',
        description: 'Movie Description Write Here…'),
    const NewOnCinemaModel(
        image: 'assets/images/new_on_cinema3.png',
        title: "Greyhound",
        resolution: 'HD',
        description: 'Movie Description Write Here…'),
  ];

  @override
  bool get stringify => false;
}

class MyListModel extends Equatable {
  const MyListModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.resolution,
      required this.year,
      required this.age});

  final String image;
  final String title;
  final String description;
  final String resolution;
  final String year;
  final String age;

  @override
  List<Object> get props => [image, title, resolution, year, age];

  static List<MyListModel> myList1 = [
    const MyListModel(
        image: 'assets/images/my_list1.png',
        title: 'The Shawsank Red…',
        description: 'Movie Description Write Here…',
        resolution: 'HD',
        year: '2014',
        age: '13+'),
    const MyListModel(
        image: 'assets/images/my_list2.png',
        title: 'The Godfather',
        description: 'Movie Description Write Here…',
        resolution: 'HD',
        year: '2018',
        age: '13+'),
    const MyListModel(
        image: 'assets/images/my_list3.png',
        title: 'The Dark Night',
        description: 'Movie Description Write Here…',
        resolution: 'HD',
        year: '2018',
        age: '13+'),
    const MyListModel(
        image: 'assets/images/my_list4.png',
        title: 'Schindler’s List',
        description: 'Movie Description Write Here…',
        resolution: 'HD',
        year: '2014',
        age: '13+'),
  ];

  @override
  bool get stringify => false;
}

class MayBeYouLikes extends Equatable {
  const MayBeYouLikes({
    required this.image,
  });

  final String image;
  @override
  List<Object> get props => [image];

  static List<MayBeYouLikes> searchList1 = [
    const MayBeYouLikes(
      image: 'assets/images/maybe_you_likes1.png',
    ),
    const MayBeYouLikes(
      image: 'assets/images/maybe_you_likes2.png',
    ),
  ];

  @override
  bool get stringify => false;
}

class SearchResult extends Equatable {
  const SearchResult({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;
  @override
  List<Object> get props => [image, title, description];

  static List<SearchResult> searchResult1 = [
    const SearchResult(
        image: 'assets/images/search_result1.png',
        title: 'Maze Runner - Guide to T…',
        description: 'a hit man wanting to go straight…'),
    const SearchResult(
        image: 'assets/images/search_result2.png',
        title: 'Maze Runner - Scorch Tri…',
        description: '2019 American coming-of-age…'),
    const SearchResult(
        image: 'assets/images/search_result3.png',
        title: 'Maze Runner - Death Cure',
        description: 'a hit man wanting to go straight…'),
  ];

  @override
  bool get stringify => false;
}
