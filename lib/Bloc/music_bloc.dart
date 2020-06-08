import 'dart:async';
import 'dart:convert';

import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:funmusic/constants/constants.dart';
import 'package:funmusic/helper/secure_storage.dart';

class MusicBloc {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  MusicBloc() {}


  initialize() {
    Timer(Duration(seconds: 2), () async {
      List<SongInfo> libSongs = await audioQuery.getSongs();

      List<Map<String, dynamic>> convertedSongs = [];
      libSongs.forEach((element) {
        var song = {
          "id": element.id,
          "albumArtwork": element.albumArtwork,
          "album": element.album,
          "albumId": element.albumId,
          "artist": element.artist,
          "artistId": element.artistId,
          "composer": element.composer,
          "displayName": element.displayName,
          "duration": element.duration,
          "filePath": element.filePath,
          "title": element.title,
          "track": element.track,
          "year": element.year,
        };
        convertedSongs.add(song);
      });
      print(libSongs[0]);
    });
  }
}
