import 'package:anime_comics_finder/entities/media.dart';
import 'package:anime_comics_finder/homePage/home_page_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController hmCtrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime, Manhwa Search App"),
      ),
      body: FutureBuilder(
        future: hmCtrl.getPopularLists(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: [
                HorizontalList(
                  mediaList: hmCtrl.anime,
                  title: "Most Popular Anime",
                ),
                HorizontalList(
                  mediaList: hmCtrl.manga,
                  title: "Most Popular Manga",
                ),
                HorizontalList(
                  mediaList: hmCtrl.manhwa,
                  title: "Most Popular Manhwa",
                ),
                HorizontalList(
                  mediaList: hmCtrl.manhua,
                  title: "Most Popular Manhua",
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    Key? key,
    required this.title,
    required this.mediaList,
  }) : super(key: key);
  final List<Media> mediaList;
  final String title;

  @override
  Widget build(BuildContext context) {
    mediaList.forEach((element) {
      debugPrint(element.title.toString());
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.text.bold.size(20).make().p12(),
        5.heightBox,
        SizedBox(
          height: 200,
          child: Scrollbar(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mediaList.length,
              itemBuilder: (context, index) {
                final item = mediaList[index];
                return AspectRatio(
                  aspectRatio: 8 / 12,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: item.coverImage!.large!,
                          height: 180,
                          width: 120,
                        ),
                        4.heightBox,
                        Text(
                          item.title!.english ?? "No Title",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
