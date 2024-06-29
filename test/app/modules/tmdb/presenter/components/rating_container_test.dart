import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_app/app/modules/tmdb/l10n/movie_l10n.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/rating_container.dart';

import '../../utils/default_structure.dart';

void main() {
  final MovieL10n text = MovieL10n();
  testWidgets('Should render a Rate container', (WidgetTester tester) async {
    await tester.pumpWidget(defaultStructure(RatingContainer(rating: 8.0)));
    expect(find.byType(RatingContainer), findsOneWidget);
    expect(find.text(text.avaliation), findsOneWidget);
    expect(find.text('8.0/10'), findsOneWidget);
  });


  testWidgets('Should render a Rate container with rounded rate', (WidgetTester tester) async {
    await tester.pumpWidget(defaultStructure(RatingContainer(rating: 3.38764)));
    expect(find.byType(RatingContainer), findsOneWidget);
    expect(find.text(text.avaliation), findsOneWidget);
    expect(find.text('3.4/10'), findsOneWidget);
  });
}