import 'package:flutter/material.dart';

/// This is the stateless widget that the main application instantiates.
class inforCard extends StatelessWidget {
  const inforCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 300,
          width: 400,
          child: Card(
            elevation: 15.0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))), //设置圆角

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text(
                    'The Enchanted Nightingale',
                    style: TextStyle(fontSize: 30),
                  ),
                  subtitle:
                      Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
              ],
            ),
          )),
    );
  }
}
