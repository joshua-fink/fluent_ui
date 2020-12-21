import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

// final appKey = GlobalKey<_MyAppState>();
final homeKey = GlobalKey();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Fluent ui app showcase',
      // themeMode: _mode,
      initialRoute: '/',
      routes: {
        '/': (_) => MyHomePage(key: homeKey),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value = false;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      header: AppBar(
        title: Text('Fluent UI App Showcase'),
        // leading: IconButton(
          // icon: AnimatedSwitcher(
          //   duration: Duration(milliseconds: 600),
          //   child: Icon(
          //     appKey.currentState.mode == ThemeMode.light
          //         ? FluentIcons.lightbulb_24_filled
          //         : FluentIcons.lightbulb_24_regular,
          //     color: Colors.white,
          //     key: ValueKey<ThemeMode>(appKey.currentState.mode),
          //   ),
          // ),
          // style: IconButtonStyle(
          //   border: (_) => Border.all(color: Colors.white, width: 0.6),
          //   margin: EdgeInsets.all(8),
          // ),
          // onPressed: () {
          //   appKey.currentState.mode =
          //       appKey.currentState.mode == ThemeMode.light
          //           ? ThemeMode.dark
          //           : ThemeMode.light;
          // },
        // ),
        bottom: Pivot(
          currentIndex: index,
          onChanged: (i) => setState(() => index = i),
          pivots: [
            PivotItem(text: Text('Buttons')),
            PivotItem(text: Text('Surfaces')),
          ],
        ),
      ),
      body: PivotView(
        currentIndex: index,
        pages: <Widget>[
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Button.compound(
                text: Text('Next page'),
                subtext: Text('Select ingredients'),
                // icon: Icon(FluentIcons.food_24_regular),
                // trailingIcon: Icon(FluentIcons.arrow_next_24_regular),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return Dialog(
                          title: Text('Missing Subject'),
                          body: Text('Do you want to send this message without a subject?'),
                          footer: [
                            Button.primary(text: Text('Save'), onPressed: () {}),
                            Button(text: Text('Cancel'), onPressed: () {}),
                          ],
                        );
                      });
                },
              ),
              Button.action(
                icon: Icon(FluentIcons.person_24_filled),
                text: Text('Action Button'),
                onPressed: () {},
              ),
              Button.icon(
                icon: Icon(FluentIcons.add_24_regular),
                menu: Icon(FluentIcons.swipe_down_24_regular),
                onPressed: () {},
              ),
              Checkbox(
                checked: value,
                onChanged: (v) => setState(() => value = v),
                // onChange: null,
              ),
              Toggle(
                checked: value,
                onChanged: (v) => setState(() => value = v),
              ),
              ToggleListCell(
                title: Text('Title'),
                checked: value,
                onChanged: (v) => setState(() => value = v),
                opposite: Icon(FluentIcons.person_28_filled),
              ),
            ],
          ),
          Column(
            children: [
              Card(
                child: Text('hahaha'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}