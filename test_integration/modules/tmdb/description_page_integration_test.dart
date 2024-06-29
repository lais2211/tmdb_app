import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/horizontal_list_cast.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/horizontal_movies_section.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/movie_card.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/rating_container.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/realese_date_container.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/search_section.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/space_bar.dart';

import 'package:tmdb_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

   testWidgets(
    'Should lead to Description Page',
    (tester) async {
      app.main();

       await tester.pumpAndSettle(const Duration(seconds: 2));
       expect(find.text('TMDB'), findsOneWidget);
       await tester.pumpAndSettle();

       expect(find.byType(SearchSection), findsOneWidget);
       await tester.pumpAndSettle();

       expect(find.byType(HorizontalMoviesSection), findsNWidgets(4));

     var cards = find.byType(MovieCard);
    expect(cards, findsWidgets);

    await tester.tap(cards.last);
    await tester.pumpAndSettle();

      expect(find.byType(SpaceBar), findsOneWidget);
      expect(find.byType(ReleaseDateContainer), findsOneWidget);
      expect(find.byType(RatingContainer), findsOneWidget);
      expect(find.byType(HorizontalListCast), findsOneWidget);
    },
    skip: false,
    timeout: const Timeout(Duration(minutes: 3)),
  );

}
