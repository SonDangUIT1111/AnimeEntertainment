import 'package:anime_and_comic_entertainment/model/animes.dart';
import 'package:flutter/material.dart';

class VideoProvider extends ChangeNotifier {
  Animes _anime = Animes();

  Animes get anime => _anime;
  void setAnime(Animes item) {
    _anime = item;
    notifyListeners();
  }
}
