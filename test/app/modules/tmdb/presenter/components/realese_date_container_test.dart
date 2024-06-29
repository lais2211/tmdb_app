import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_app/app/modules/tmdb/l10n/movie_l10n.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/realese_date_container.dart';

import '../../utils/default_structure.dart';

void main() {
  final MovieL10n text = MovieL10n();
  testWidgets('Should render a realese container', (WidgetTester tester) async {
    await tester.pumpWidget(defaultStructure(ReleaseDateContainer(releaseDate: '16/03/2000')));
    expect(find.byType(ReleaseDateContainer), findsOneWidget);
    expect(find.text(text.nowPlayingMovies), findsOneWidget);
    expect(find.text('16/03/2000'), findsOneWidget);
  });
}