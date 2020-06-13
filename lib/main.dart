import 'package:experiment/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _buildRefresherText(BuildContext context, String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon),
        SizedBox(width: 20),
        Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Smart Refresher under the global configuration subtree, here are a few particularly important attributes
    return RefreshConfiguration(
      headerBuilder: () => CustomHeader(
        builder: (BuildContext context, RefreshStatus mode) {
          Widget body;
          switch (mode) {
            case RefreshStatus.idle:
              body = _buildRefresherText(
                context,
                'Pull-up to increment',
                Icons.refresh,
              );
              break;

            case RefreshStatus.refreshing:
              body = _buildRefresherText(
                context,
                'Incrementing...',
                Icons.hourglass_full,
              );
              break;

            case RefreshStatus.failed:
              body = _buildRefresherText(
                context,
                'Failed to increment',
                Icons.sync_problem,
              );
              break;

            case RefreshStatus.canRefresh:
              body = _buildRefresherText(
                context,
                'Release to increment',
                Icons.thumb_up,
              );
              break;

            case RefreshStatus.completed:
              body = _buildRefresherText(
                context,
                'Job is done',
                Icons.check,
              );
              break;

            default:
              body = Text('TODO: implement this state');
          }

          return body;
        },
      ),
      footerBuilder: () =>
          CustomFooter(builder: (BuildContext context, LoadStatus mode) {
        Widget body;

        switch (mode) {
          case LoadStatus.idle:
            body = _buildRefresherText(
              context,
              'Pull-down to increment',
              Icons.refresh,
            );
            break;

          case LoadStatus.loading:
            body = _buildRefresherText(
              context,
              'Incrementing...',
              Icons.hourglass_full,
            );
            break;

          case LoadStatus.failed:
            body = _buildRefresherText(
              context,
              'Failed to increment',
              Icons.sync_problem,
            );
            break;

          case LoadStatus.canLoading:
            body = _buildRefresherText(
              context,
              'Release to increment',
              Icons.thumb_up,
            );
            break;

          case LoadStatus.noMore:
            body = _buildRefresherText(
              context,
              'Job is done',
              Icons.check,
            );
            break;

          default:
            body = Text('TODO: implement this state');
        }

        return body;
      }), // Configure default bottom indicator
      headerTriggerDistance: 80.0, // header trigger refresh trigger distance
      //springDescription:SpringDescription(stiffness: 170, damping: 16, mass: 1.9), // custom spring back animate,the props meaning see the flutter api
      maxOverScrollExtent:
          100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
      maxUnderScrollExtent: 0, // Maximum dragging range at the bottom
      enableScrollWhenRefreshCompleted:
          true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
      enableLoadingWhenFailed:
          true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
      hideFooterWhenNotFull:
          false, // Disable pull-up to load more functionality when Viewport is less than one screen
      enableBallisticLoad: true, // trigger load more by BallisticScrollActivity

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/home': (context) => HomePage(),
        },
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  RefreshController _refreshCtrl = RefreshController(initialRefresh: false);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /// Refresh is when user is on page's top and do a scroll-up movement
  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    _incrementCounter();
    _refreshCtrl.refreshCompleted();
    print('refresh completed');
  }

  /// Load is when user is at page's bottom and do a scroll-down movement
  void _onLoad() async {
    await Future.delayed(Duration(milliseconds: 500));
    _incrementCounter();
    _refreshCtrl.loadComplete();
    print('load completed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pull_to_refresh demo'),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshCtrl,
        onRefresh: _onRefresh,
        onLoading: _onLoad,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Refresh page or load more to increment counter:'),
              Text('$_counter', style: Theme.of(context).textTheme.headline4),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Tooltip',
        child: Icon(Icons.add),
      ),
    );
  }
}
