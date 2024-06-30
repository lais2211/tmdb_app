import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/horizontal_movies_section.dart';

import 'package:tmdb_app/app/modules/tmdb/presenter/components/search_section.dart';

import 'package:tmdb_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Should lead to Home Page',
    (tester) async {
      app.main();

      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.text('TMDB'), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(SearchSection), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(HorizontalMoviesSection), findsNWidgets(4));
    },
    skip: false,
    timeout: const Timeout(Duration(minutes: 3)),
  );
}
