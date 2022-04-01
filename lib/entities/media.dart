class Media {
  Title? title;
  String? type;
  String? description;
  int? averageScore;
  CoverImage? coverImage;
  String? bannerImage;
  int? popularity;

  Media({this.title, this.type, this.description, this.averageScore, this.coverImage, this.bannerImage, this.popularity});

  Media.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    type = json['type'];
    description = json['description'];
    averageScore = json['averageScore'];
    coverImage = json['coverImage'] != null ? CoverImage.fromJson(json['coverImage']) : null;
    bannerImage = json['bannerImage'];
    popularity = json['popularity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['type'] = type;
    data['description'] = description;
    data['averageScore'] = averageScore;
    if (coverImage != null) {
      data['coverImage'] = coverImage!.toJson();
    }
    data['bannerImage'] = bannerImage;
    data['popularity'] = popularity;
    return data;
  }
}

class Title {
  String? english;
  String? romaji;

  Title({this.english, this.romaji});

  Title.fromJson(Map<String, dynamic> json) {
    english = json['english'];
    romaji = json['romaji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['english'] = english;
    data['romaji'] = romaji;
    return data;
  }
}

class CoverImage {
  String? large;
  String? medium;

  CoverImage({this.large, this.medium});

  CoverImage.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['large'] = large;
    data['medium'] = medium;
    return data;
  }
}
