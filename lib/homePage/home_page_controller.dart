import 'package:anime_comics_finder/entities/media.dart';
import 'package:anime_comics_finder/repo/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Repository repository = Repository();

  late List<Media> anime, manhwa, manga, manhua;

  Future<void> getPopularLists() async {
    manhwa = await repository.getPopContentList("KR", Type.MANGA);
    manga = await repository.getPopContentList("JP", Type.MANGA);
    manhua = await repository.getPopContentList("CN", Type.MANGA);
    anime = await repository.getPopContentList("JP", Type.ANIME);
  }
}
