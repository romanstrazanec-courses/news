import 'package:flutter/material.dart';

import 'screens/news_list.dart';
import 'screens/news_detail.dart';
import 'blocs/stories_provider.dart';
import 'blocs/comments_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'News!',
          onGenerateRoute: routes,
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    return (settings.name == '/')
        ? MaterialPageRoute(builder: (BuildContext context) {
            final storiesBloc = StoriesProvider.of(context);
            storiesBloc.fetchTopIds();
            return NewsList();
          })
        : MaterialPageRoute(
            builder: (BuildContext context) {
              final commentsBloc = CommentsProvider.of(context);
              final itemId = int.parse(settings.name.replaceFirst('/', ''));

              commentsBloc.fetchItemWithComments(itemId);

              return NewsDetail(itemId: itemId);
            },
          );
  }
}
