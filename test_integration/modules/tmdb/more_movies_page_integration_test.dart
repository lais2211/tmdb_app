import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/horizontal_movies_section.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/movie_card.dart';

import 'package:tmdb_app/app/modules/tmdb/presenter/components/search_section.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/vertical_movies_section.dart';

import 'package:tmdb_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Should lead to More movies Page',
    (tester) async {
      app.main();

      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.text('TMDB'), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(SearchSection), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(HorizontalMoviesSection), findsNWidgets(4));

      Finder elevatedButton = find.byType(ElevatedButton);

      await tester.pumpAndSettle();
      expect(elevatedButton, findsWidgets);
      await tester.tap(elevatedButton.first);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byType(VerticalMoviesSection), findsOneWidget);
      expect(find.byType(MovieCard), findsWidgets);
    },
    skip: false,
    timeout: const Timeout(Duration(minutes: 3)),
  );
}
