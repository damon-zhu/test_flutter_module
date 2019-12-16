import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
// import 'package:platform_view.dart';
import 'platform_view.dart';

class FirstRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open second route'),
          onPressed: () {
            print("open second page!");
            FlutterBoost.singleton.open("second").then((Map value) {
              print(
                  "call me when page is finished. did recieve second route result $value");
            });
          },
        ),
      ),
    );
  }
}

class SecondRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.

            BoostContainerSettings settings =
                BoostContainer.of(context).settings;
            FlutterBoost.singleton.close(settings.uniqueId,
                result: {"result": "data from second"});
          },
          child: Text('Go back with result!'),
        ),
      ),
    );
  }
}

class TabRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            FlutterBoost.singleton.open("second");
          },
          child: Text('Open second route'),
        ),
      ),
    );
  }
}

class PlatformRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Platform Route"),
      ),
      body: Center(
        child: RaisedButton(
          child: TextView(),
          onPressed: () {
            print("open second page!");
            FlutterBoost.singleton.open("second").then((Map value) {
              print(
                  "call me when page is finished. did recieve second route result $value");
            });
          },
        ),
      ),
    );
  }
}
class FlutterRouteWidget extends StatefulWidget {
  FlutterRouteWidget({this.params,this.message});
  final Map params;
  final String message;

  @override
  _FlutterRouteWidgetState createState() => _FlutterRouteWidgetState();
}

class _FlutterRouteWidgetState extends State<FlutterRouteWidget> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String message=widget.message;
    return Scaffold(
      appBar: AppBar(
        brightness:Brightness.light,
        backgroundColor: Colors.white,
        textTheme:new TextTheme(title: TextStyle(color: Colors.black)) ,

        title: Text('flutter_boost_example'),
      ),
      body: SingleChildScrollView(
        child:Container(
            margin: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10.0,bottom: 20.0),
                  child: Text(
                    message ?? "This is a flutter activity \n params:${widget.params}",
                    style: TextStyle(fontSize: 28.0, color: Colors.blue),
                  ),
                  alignment: AlignmentDirectional.center,
                ),
//                Expanded(child: Container()),
                const CupertinoTextField(
                  prefix: Icon(
                    CupertinoIcons.person_solid,
                    color: CupertinoColors.lightBackgroundGray,
                    size: 28.0,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
                  clearButtonMode: OverlayVisibilityMode.editing,
                  textCapitalization: TextCapitalization.words,
                  autocorrect: false,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.0, color: CupertinoColors.inactiveGray)),
                  ),
                  placeholder: 'Name',
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      color: Colors.yellow,
                      child: Text(
                        'open native page',
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                      )),

                  ///后面的参数会在native的IPlatform.startActivity方法回调中拼接到url的query部分。
                  ///例如：sample://nativePage?aaa=bbb
                  onTap: () => FlutterBoost.singleton
                      .open("sample://nativePage", urlParams: {
                    "query": {"aaa": "bbb"}
                  }),
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      color: Colors.yellow,
                      child: Text(
                        'open first',
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                      )),

                  ///后面的参数会在native的IPlatform.startActivity方法回调中拼接到url的query部分。
                  ///例如：sample://nativePage?aaa=bbb
                  onTap: () => FlutterBoost.singleton
                      .open("first", urlParams: {
                    "query": {"aaa": "bbb"}
                  }),
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      color: Colors.yellow,
                      child: Text(
                        'open second',
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                      )),

                  ///后面的参数会在native的IPlatform.startActivity方法回调中拼接到url的query部分。
                  ///例如：sample://nativePage?aaa=bbb
                  onTap: () => FlutterBoost.singleton
                      .open("second", urlParams: {
                    "query": {"aaa": "bbb"}
                  }),
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      color: Colors.yellow,
                      child: Text(
                        'open tab',
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                      )),

                  ///后面的参数会在native的IPlatform.startActivity方法回调中拼接到url的query部分。
                  ///例如：sample://nativePage?aaa=bbb
                  onTap: () => FlutterBoost.singleton
                      .open("tab", urlParams: {
                    "query": {"aaa": "bbb"}
                  }),
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      color: Colors.yellow,
                      child: Text(
                        'open flutter page',
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                      )),

                  ///后面的参数会在native的IPlatform.startActivity方法回调中拼接到url的query部分。
                  ///例如：sample://nativePage?aaa=bbb
                  onTap: () => FlutterBoost.singleton
                      .open("sample://flutterPage", urlParams: {
                    "query": {"aaa": "bbb"}
                  }),
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      color: Colors.yellow,
                      child: Text(
                        'push flutter widget',
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                      )),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PushWidget()));
                  },
                ),

              InkWell(
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.yellow,
                    child: Text(
                      'push Platform demo',
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    )),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => PlatformRouteWidget()));
                },
              ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      color: Colors.yellow,
                      child: Text(
                        'open flutter fragment page',
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                      )),
                  onTap: () => FlutterBoost.singleton
                      .open("sample://flutterFragmentPage"),
                ),
              ],
            ),

        ),
      ),
    );
  }
}

class FragmentRouteWidget extends StatelessWidget {
  final Map params;

  FragmentRouteWidget(this.params);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_boost_example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 80.0),
            child: Text(
              "This is a flutter fragment",
              style: TextStyle(fontSize: 28.0, color: Colors.blue),
            ),
            alignment: AlignmentDirectional.center,
          ),
          Container(
            margin: const EdgeInsets.only(top: 32.0),
            child: Text(
              params['tag'] ?? '',
              style: TextStyle(fontSize: 28.0, color: Colors.red),
            ),
            alignment: AlignmentDirectional.center,
          ),
          Expanded(child: Container()),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                color: Colors.yellow,
                child: Text(
                  'open native page',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                )),
            onTap: () => FlutterBoost.singleton.open("sample://nativePage"),
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                color: Colors.yellow,
                child: Text(
                  'open flutter page',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                )),
            onTap: () => FlutterBoost.singleton.open("sample://flutterPage"),
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 80.0),
                color: Colors.yellow,
                child: Text(
                  'open flutter fragment page',
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                )),
            onTap: () =>
                FlutterBoost.singleton.open("sample://flutterFragmentPage"),
          )
        ],
      ),
    );
  }
}

class PushWidget extends StatefulWidget {
  @override
  _PushWidgetState createState() => _PushWidgetState();
}

class _PushWidgetState extends State<PushWidget> {
  VoidCallback _backPressedListenerUnsub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

//    if (_backPressedListenerUnsub == null) {
//      _backPressedListenerUnsub =
//          BoostContainer.of(context).addBackPressedListener(() {
//        if (BoostContainer.of(context).onstage &&
//            ModalRoute.of(context).isCurrent) {
//          Navigator.pop(context);
//        }
//      });
//    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _backPressedListenerUnsub?.call();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterRouteWidget(message: "Pushed Widget");
  }
}
