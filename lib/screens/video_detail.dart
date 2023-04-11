import 'dart:ui' as ui;
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:halkut_demo1/constants/constants.dart';

class VideoDetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String resolution;
  final String description;

  const VideoDetailScreen(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.resolution,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width - 377),
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height - 318),
            fit: BoxFit.fill,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: AppConstants.backgroundColor.withOpacity(0.8044),
            ),
          ),
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 116),
                  ),
                  Image.asset(
                    imagePath,
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 229),
                    width: MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width - 148.28),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 40),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.fontColor,
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1h 29m',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppConstants.fontColor.withOpacity(0.7),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.fromLTRB(4, 2, 3, 2),
                        color: AppConstants.backgroundColor.withOpacity(0.8),
                        child: Text(
                          resolution,
                          style: TextStyle(
                              color: AppConstants.fontColor.withOpacity(0.7),
                              fontSize: 10,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Adventure',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      DotsIndicator(
                        dotsCount: 1,
                        decorator: const DotsDecorator(
                            activeColor:
                                AppConstants.textButtonBackgroundColor),
                      ),
                      const Text(
                        'Romantic',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      DotsIndicator(
                        dotsCount: 1,
                        decorator: const DotsDecorator(
                            activeColor:
                                AppConstants.textButtonBackgroundColor),
                      ),
                      const Text(
                        'Thriller',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 24)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 36),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22, right: 20),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow_outlined),
                        label: const Text('Play'),
                        style: const ButtonStyle(
                            iconSize: MaterialStatePropertyAll(14),
                            textStyle: MaterialStatePropertyAll(TextStyle(
                                color: AppConstants.playButtonColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14))),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 16)),
                  SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height -
                              (MediaQuery.of(context).size.height - 36),
                          width: MediaQuery.of(context).size.width -
                              (MediaQuery.of(context).size.width - 160),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 22, right: 7.5),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: AppConstants.textButtonBackgroundColor,
                              ),
                              label: const Text(
                                'My List',
                                style: TextStyle(color: AppConstants.fontColor),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppConstants.iconColor.withOpacity(0.12)),
                                  iconSize: const MaterialStatePropertyAll(14),
                                  textStyle:
                                      const MaterialStatePropertyAll(TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height -
                              (MediaQuery.of(context).size.height - 36),
                          width: MediaQuery.of(context).size.width -
                              (MediaQuery.of(context).size.width - 160),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 7.5, right: 20),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.download_outlined,
                                color: AppConstants.textButtonBackgroundColor,
                              ),
                              label: const Text(
                                'Download',
                                style: TextStyle(color: AppConstants.fontColor),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppConstants.iconColor.withOpacity(0.12)),
                                  iconSize: const MaterialStatePropertyAll(14),
                                  textStyle:
                                      const MaterialStatePropertyAll(TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 16)),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 21),
                    child: Text(
                      description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppConstants.fontColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 16)),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 21),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Cast: Kieman Shipka, Stanley Tucci, Miranda Otto',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppConstants.fontColor.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 8)),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 21),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Director: John R. Leonetti',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppConstants.fontColor.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
