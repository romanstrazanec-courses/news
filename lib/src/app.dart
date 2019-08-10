import 'package:flutter/material.dart';

import 'screens/news_list.dart';
import 'screens/news_detail.dart';
import 'blocs/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News!',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    return (settings.name == '/')
        ? MaterialPageRoute(builder: (BuildContext context) => NewsList())
        : MaterialPageRoute(
            builder: (BuildContext context) {
              final itemId = int.parse(settings.name.replaceFirst('/', ''));
              return NewsDetail(itemId: itemId);
            },
          );
  }
}
