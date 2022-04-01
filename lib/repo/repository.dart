import 'dart:convert';

import 'package:anime_comics_finder/entities/media.dart';
import 'package:http/http.dart' as http;

abstract class RepositoryI {
  Future<List<Media>> getPopContentList(String countryCode, Type type);
}

class Repository extends RepositoryI {
  @override
  Future<List<Media>> getPopContentList(String countryCode, Type type) async {
    String query = '''
    {
      Page(perPage:20){
        media(countryOfOrigin:"$countryCode",sort:POPULARITY_DESC,type:${type.name}){
          title{
            english
          }   
          coverImage {       
            large
      	    medium
          }   
          description
          averageScore
          type          
          bannerImage
          popularity
        }
      }
    } 
    ''';
    http.Response response = await http.post(
      Uri.https("graphql.anilist.co", "/"),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      body: jsonEncode({"query": query}),
    );

    List<Map<String, dynamic>> responseList = List<Map<String, dynamic>>.from(jsonDecode(response.body)["data"]["Page"]["media"]);
    List<Media> mediaList = responseList.map((e) => Media.fromJson(e)).toList();
    return mediaList;
  }
}

enum Type { ANIME, MANGA }
