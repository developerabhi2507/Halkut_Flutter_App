import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:halkut_demo1/screens/video_detail.dart';

import '../constants/constants.dart';
import '../models/home_screen_model.dart';

class SectionDetail extends StatefulWidget {
  const SectionDetail({super.key});

  @override
  State<SectionDetail> createState() => _SectionDetailState();
}

class _SectionDetailState extends State<SectionDetail> {
  // List<StaggeredGridTile> _staggeredTiles = <StaggeredGridTile>[
  //   StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 3, child: child)
  // ];
  @override
  Widget build(BuildContext context) {
    int index = 0;
    return const Scaffold(
      body: StaggeredTiles(),
    );
  }
}

class StaggeredTiles extends StatelessWidget {
  const StaggeredTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16, left: 20, bottom: 16),
          child: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Popular Movies',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              )),
        ),
        StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          children: PopularMoviesModel.homeSlide2
              .map((popularSlide) =>
                  PopularMovies(popularMoviesModel: popularSlide))
              .toList(),
        ),
      ],
    );
  }
}

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    super.key,
    required this.popularMoviesModel,
  });
  final PopularMoviesModel popularMoviesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: MediaQuery.of(context).size.height -
          (MediaQuery.of(context).size.height - 276),
      width: MediaQuery.of(context).size.width -
          (MediaQuery.of(context).size.width - 160),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width - 160),
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height - 214),
                child: Stack(children: [
                  InkWell(
                    onTap: () {
                      Get.to(VideoDetailScreen(
                          imagePath: popularMoviesModel.image,
                          title: popularMoviesModel.title,
                          resolution: popularMoviesModel.resolution,
                          description: popularMoviesModel.description));
                    },
                    child: Ink(
                      child: Image.asset(
                        popularMoviesModel.image,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height - 214),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 4, bottom: 4, right: 115),
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
                  (MediaQuery.of(context).size.height - 8),
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
