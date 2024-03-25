import 'package:flutter/material.dart';
import 'package:anime_and_comic_entertainment/tab_navigator.dart';
import 'package:flutter/cupertino.dart';

/////////////////////////////////////////////////////////////////////////////
/// DIY NAVIGATOR SOLUTION
////////////////////////////////////////////////////////////////////////////
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  String _currentPage = "Page1";
  List<String> pageKeys = ["Page1", "Page2", "Page3"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        _buildOffstageNavigator("Page1"),
        _buildOffstageNavigator("Page2"),
        _buildOffstageNavigator("Page3"),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        onTap: (int index) {
          _selectTab(pageKeys[index], index);
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.looks_one),
            label: 'Page1',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.looks_two),
            label: 'Page2',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.looks_3),
            label: 'Page3',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////
/// CUPERTINO SOLUTION
////////////////////////////////////////////////////////////////////////////
class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page1(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page2(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page3(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Page1(),
              );
            });
        }
      },
    );
  }
}

/////////////////////////////////////////////////////////////////////////////
/// CUSTOM NAVIGATOR OR CUSTOM SCAFFOLD
////////////////////////////////////////////////////////////////////////////
// class MyHomePage extends StatefulWidget {
//   MyHomePage({required Key key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<Widget> _children = [
//     Page1(),
//     Page2(),
//     Page3(),
//   ];
//   Widget _page = Page1();
//   int _currentIndex = 0;

//   GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     bottomNavigationBar: BottomNavigationBar(
//       items: _items,
//       onTap: (index) {

//         navigatorKey.currentState.maybePop();
//         setState(() => _page = _children[index]);
//         _currentIndex = index;
//       },
//       currentIndex: _currentIndex,
//     ),
//     body: CustomNavigator(
//       navigatorKey: navigatorKey,
//       home: _page,
//       pageRoute: PageRoutes.materialPageRoute,
//     ),
//   );
// }
//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       scaffold: Scaffold(
//         bottomNavigationBar: BottomNavigationBar(items: [
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.looks_one),
//             title: new Text('Page1'),
//           ),
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.looks_two),
//             title: new Text('Page2'),
//           ),
//           BottomNavigationBarItem(
//             icon: new Icon(Icons.looks_3),
//             title: new Text('Page3'),
//           ),
//       ],),
//       ),
//     children: <Widget>[
//        Page1(),
//         Page2(),
//         Page3(),
//     ],

//       onItemTap: (index) {},
//     );
//   }
// }

// class CustomNavigatorHomePage extends StatefulWidget {
//   CustomNavigatorHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _CustomNavigatorHomePageState createState() => _CustomNavigatorHomePageState();
// }

// class _CustomNavigatorHomePageState extends State<CustomNavigatorHomePage> {
//   final List<Widget> _children = [
//     Page1(),
//     Page2(),
//     Page3(),
//   ];
//   Widget _page = Page1();
//   int _currentIndex = 0;

//   GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: _items,
//         onTap: (index) {
//           navigatorKey.currentState.maybePop();
//           setState(() => _page = _children[index]);
//           _currentIndex = index;
//         },
//         currentIndex: _currentIndex,
//       ),
//       body: CustomNavigator(
//         navigatorKey: navigatorKey,
//         home: _page,
//         pageRoute: PageRoutes.materialPageRoute,
//       ),
//     );
//   }
//   final _items = [
//     BottomNavigationBarItem(
//       icon: new Icon(Icons.looks_one),
//       title: new Text('Page1'),
//     ),
//     BottomNavigationBarItem(
//       icon: new Icon(Icons.looks_two),
//       title: new Text('Page2'),
//     ),
//     BottomNavigationBarItem(
//       icon: new Icon(Icons.looks_3),
//       title: new Text('Page3'),
//     ),
//   ];
// }

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Page 1"), actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.ac_unit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new ListViewPage()));
                  })
            ]),
            body: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new ListViewPage()));
                    },
                    child: Text("Switch Page - Subscribe")))));
  }

  @override
  bool get wantKeepAlive => true;
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Page 2"), actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.ac_unit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new Page2()));
                  })
            ]),
            body: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new ListViewPage()));
                    },
                    child: Text("Switch Page - Leave a Like")))));
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Page 3"), actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.ac_unit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new Page2()));
                  })
            ]),
            body: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new ListViewPage(
                                    key: null,
                                  )));
                    },
                    child: Text("Switch Page - Comment")))));
  }
}

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Infinite List"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
              leading: Text("$index"), title: Text("Number $index"));
        },
      ),
    );
  }
}
