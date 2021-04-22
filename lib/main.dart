import 'dart:math';

import 'package:flutter/material.dart';
import 'package:easy_model/easy_model.dart';
import 'package:justlist/edit_markdown_page.dart';

import 'package:markdown_widget/markdown_widget.dart';
import 'package:justlist/testdata.dart';

import 'infor_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memoire! 项目日志',
      theme: myTheme(false),
      darkTheme: myTheme(true),
      home: MyHomePage(title: 'Memoire!项目日志'),
    );
  }

  ThemeData myTheme(bool isDarkMode) {
    return ThemeData(
      cardTheme: CardTheme(
          shadowColor: isDarkMode ? Colors.black : Colors.grey[400],
          color: isDarkMode ? Colors.grey[800] : Colors.white),
      iconTheme: IconThemeData(
          color: isDarkMode ? Colors.grey[300] : Colors.grey[850]),
      scaffoldBackgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
      textTheme: TextTheme(
        headline5: isDarkMode
            ? TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.bold)
            : TextStyle(
                color: Colors.black26,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
        headline6: isDarkMode
            ? TextStyle(color: Colors.white70)
            : TextStyle(color: Colors.black26),
        // subtitle1: isDarkMode
        //     ? TextStyle(color: Colors.white70)
        //     : TextStyle(color: Colors.black26),
        // TextField输入文字颜色
        subtitle1: isDarkMode
            ? TextStyle(color: Colors.grey[300], letterSpacing: 1.5)
            : TextStyle(color: Colors.grey[850], letterSpacing: 1.5),
        subtitle2: isDarkMode
            ? TextStyle(color: Colors.white70)
            : TextStyle(color: Colors.black26),
        // Text默认文字样式
        bodyText1: isDarkMode
            ? TextStyle(color: Colors.white)
            : TextStyle(color: Colors.black26),
        bodyText2: isDarkMode
            ? TextStyle(color: Colors.white)
            : TextStyle(color: Colors.black26),
        // 这里用于小文字样式
        caption: isDarkMode
            ? TextStyle(color: Colors.grey[200])
            : TextStyle(color: Colors.grey[600]),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: DrawerInCardStyle(),
      body: CustomScrollView(
        slivers: <Widget>[
          // Add the app bar to the CustomScrollView.
          SliverAppBar(
              // Provide a standard title.
              // title: Text("Memoire! 项目日志"),
              // Allows the user to reveal the app bar if they begin scrolling
              // back up the list of items.
              pinned: true,
              floating: true,
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Memoire! 项目日志"),
                background: FlutterLogo(),
              ),
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: MediaQuery.of(context).size.aspectRatio < 1
                  ? min(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height) /
                      2
                  : MediaQuery.of(context).size.height),
          // Next, create a SliverList
          SliverPadding(
            padding: EdgeInsets.all(50),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                maxCrossAxisExtent: 800,
                mainAxisExtent: 350,
              ),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Center(child: inforCard());
              }, childCount: 7),
            ),
          ),

          // Wrap(
          //   children: [
          //     inforCard(),
          //     inforCard(),
          //     inforCard(),
          //     inforCard(),
          //     inforCard(),
          //     inforCard(),
          //     inforCard(),
          //     inforCard(),
          //     inforCard(),
          //     inforCard(),
          //   ],
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DrawerInCardStyle extends StatelessWidget {
  const DrawerInCardStyle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: 300,
          decoration: BoxDecoration(
              color: isDark ? Colors.grey[900] : Colors.grey[50],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Spacer(),
              Row(
                children: [
                  Spacer(),
                  Icon(
                    Icons.account_circle_rounded,
                    size: 30,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text("Memoire!项目日志",
                    style: Theme.of(context).textTheme.headline5),
              ),

              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      minVerticalPadding: 15,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                            child: Text("Memoire!项目日志",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          Divider(
                            thickness: 2,
                            color: isDark ? Colors.grey[700] : Colors.grey[850],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      minVerticalPadding: 15,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                            child: Text("Memoire!项目日志",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                            child: Text("Memoire!项目日志",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                            child: Text("Memoire!项目日志",
                                style: Theme.of(context).textTheme.subtitle1),
                          ),
                          Divider(
                            thickness: 2,
                            color: isDark ? Colors.grey[700] : Colors.grey[850],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditMarkdownPage();
                        }));
                      },
                      minVerticalPadding: 15,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                              child: Row(
                                children: [
                                  Icon(Icons.note_add_rounded),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text("创建新文章",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

//  Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),

class GlobalModel extends Model {
  Brightness brightness = Brightness.light;
}
