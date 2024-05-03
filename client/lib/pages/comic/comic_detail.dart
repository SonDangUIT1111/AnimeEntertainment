import 'package:anime_and_comic_entertainment/components/comic/ComicChapter.dart';
import 'package:anime_and_comic_entertainment/components/ui/Button.dart';
import 'package:anime_and_comic_entertainment/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailComicPage extends StatelessWidget {
  final String comicId;

  DetailComicPage({required this.comicId});

  @override
  Widget build(BuildContext context) {
    List<int> ListChapters = [1, 2, 3, 4, 5, 6];

    return Scaffold(
        backgroundColor: const Color(0xFF141414),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF141414),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.squarePlus))
          ],
        ),
        body: ListView(
          children: [
            Stack(children: [
              Column(
                children: [
                  Image.network(
                      'https://popsimg.akamaized.net/api/v2/containers/file2/cms_thumbnails/nuphu2021_thumb_1280x720-9d156e7dfc82-1685355429130-YqX7xfOm.jpg?v=0&maxW=600&format=jpg'),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
              Positioned(
                right: 10,
                bottom: 0,
                child: GradientSquareButton(
                  width: 165,
                  height: 50,
                  action: () {},
                  content: 'ĐỌC NGAY',
                  cornerRadius: 10,
                ),
              )
            ]),
            Column(
              children: [
                const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                    child: Text(
                      'Nhật ký nữ phụ huấn luyện em trai',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )),
                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bookOpenReader,
                            color: Colors.white,
                          ),
                          Text(
                            'Lượt xem',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '100K',
                            style: TextStyle(color: Colors.yellow),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidThumbsUp,
                            color: Colors.white,
                          ),
                          Text(
                            'Lượt thích',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '100K',
                            style: TextStyle(color: Colors.yellow),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidFile,
                            color: Colors.white,
                          ),
                          Text(
                            'Số chương',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '100',
                            style: TextStyle(color: Colors.yellow),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Tác giả: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Họa sĩ: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Thể loại: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Nội dung bởi: ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Mô tả: Doraemon - chú mèo máy đến từ thế kỷ 22 - đã dùng cỗ '
                        'máy thời gian trở về thế kỷ 20 để làm bạn với Nobita, '
                        'một cậu bé hậu đậu, vụng về nhưng giàu lòng nhân ái...',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent),
                              child: const Text(
                                'Danh sách chương',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 218, 113, 15)),
                              )),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent),
                              child: const Text(
                                'Bình luận',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                      Container(
                          height: 3,
                          color: const Color.fromARGB(255, 218, 113, 15)),
                      Container(
                        color: Colors.black,
                        child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  '100 Chương',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Thứ 2 hàng tuần',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                          height: ListChapters.length * 100,
                          child: Column(
                            children: List.generate(
                                ListChapters.length, (index) => ComicChapter()),
                          ))
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
