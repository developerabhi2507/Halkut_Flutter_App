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
        resolution: '',
        description: 'a hit man wanting to go straight, lets his…'),
    const PopularMoviesModel(
        image: 'assets/images/popular_movies2.png',
        title: "Greta Gerwig’s Little Women",
        resolution: 'HD',
        description: '2019 American coming-of-age…'),
    const PopularMoviesModel(
        image: 'assets/images/popular_movies3.png',
        title: "Avengers - Dark Phoenix",
        resolution: '',
        description: 'The X-Men face their most…'),
    const PopularMoviesModel(
        image: 'assets/images/popular_movies4.png',
        title: "007 - No Time To Die",
        resolution: '',
        description: 'Recruited to rescue a kidnapped…'),
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
