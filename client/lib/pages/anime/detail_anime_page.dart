import 'package:anime_and_comic_entertainment/components/HotSeries.dart';
import 'package:anime_and_comic_entertainment/components/MainBanner.dart';
import 'package:anime_and_comic_entertainment/components/animes/AnimeAlbum.dart';
import 'package:anime_and_comic_entertainment/components/animes/AnimeBanner.dart';
import 'package:anime_and_comic_entertainment/components/animes/NewEpisodeList.dart';
import 'package:anime_and_comic_entertainment/components/comic/ComicItem.dart';
import 'package:anime_and_comic_entertainment/model/animes.dart';
import 'package:anime_and_comic_entertainment/services/animes_api.dart';
import 'package:anime_and_comic_entertainment/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:shimmer/shimmer.dart';

class DetailAnimePage extends StatefulWidget {
  const DetailAnimePage({super.key});

  @override
  State<DetailAnimePage> createState() => _DetailAnimePageState();
}

class _DetailAnimePageState extends State<DetailAnimePage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;
  bool isExpanded = false;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: GFAppBar(
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(
              (_scrollControllerOffset / 350).clamp(0, 1).toDouble()),
          leading: GFIconButton(
            splashColor: Colors.transparent,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            type: GFButtonType.transparent,
          ),
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.network(
              'https://vn.e-muse.com.tw/wp-content/uploads/2024/01/%E7%A7%92%E6%AE%BA%E5%A4%96%E6%8E%9B%E5%A4%AA%E5%BC%B7%E4%BA%86%EF%BC%8C%E7%95%B0%E4%B8%96%E7%95%8C%E7%9A%84%E5%82%A2%E4%BC%99%E5%80%91%E6%A0%B9%E6%9C%AC%E5%B0%B1%E4%B8%8D%E6%98%AF%E5%B0%8D%E6%89%8B%E3%80%82_%E5%AE%98%E7%B6%B2%E8%B6%8A-1.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ListView(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height - 80,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(0, 0, 0, 0),
                                      Color(0xFF050B11).withOpacity(0.9)
                                    ],
                                    stops: [0.0, 0.86],
                                  )),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(360)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 0, 0, 0),
                                    child: Center(
                                        child: ShaderMask(
                                            shaderCallback: (rect) =>
                                                LinearGradient(
                                                  colors: Utils.gradientColors,
                                                  begin: Alignment.topCenter,
                                                ).createShader(rect),
                                            child: FaIcon(
                                              FontAwesomeIcons.play,
                                              color: Colors.white,
                                              size: 50,
                                            ))),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Column(
                                children: [
                                  Text(
                                    "Năng lực lop hoc hoang gia Năng lực lop hoc hoang gia ",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Wrap(
                                    spacing: 8.0,
                                    children: [
                                      Chip(
                                        label: const Text(
                                          "Gia tuong",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        backgroundColor: Color(0xFF282727),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32)),
                                      ),
                                      Chip(
                                        label: const Text(
                                          "Gia tuong",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        backgroundColor: Color(0xFF282727),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32)),
                                      ),
                                      Chip(
                                        label: const Text(
                                          "Gia tuong",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        backgroundColor: Color(0xFF282727),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Dành cho độ tuổi: ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Flexible(
                                        child: Text("13+",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Utils.primaryColor,
                                                fontWeight: FontWeight.w600)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Phát sóng: ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Flexible(
                                        child: Text("Thứ 4 hàng tuần",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontWeight: FontWeight.w600)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Nhà phát hành: ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Flexible(
                                        child: Text("MuseVN",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                  ],
                ),
                Container(
                  color: Color(0xFF050B11).withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isExpanded
                            ? Text(
                                "Vao day mo ta vao day xem mo ta Vao day mo ta vao day xem mo ta Vao day mo ta vao day xem mo ta Vao day mo ta vao day xem mo ta Vao day mo ta vao day xem mo ta",
                                style: TextStyle(color: Colors.white),
                              )
                            : Container(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Text(
                            "Xem thêm",
                            style: TextStyle(
                              color: Colors.grey,
                              decorationThickness: 1.5,
                              decorationColor: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                        Image.network(
                          "https://imgupscaler.com/images/samples/animal-before.webp",
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
