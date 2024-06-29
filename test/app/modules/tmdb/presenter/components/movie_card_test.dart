import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/movie_card.dart';

import '../../utils/default_structure.dart';
import '../../utils/mock.dart';

void main() {
  testWidgets('Should render a Movie card on carousel mode', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async => await tester.pumpWidget(defaultStructure(MovieCard(onTap: (getMovies) {}, actualMovie: getMovies().first, isSearch: true))));
    expect(find.byType(MovieCard), findsOneWidget);
    expect(find.text('Movie 1'), findsOneWidget);
  });

  testWidgets('Should render a Movie card on horizontal mode', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async => await tester.pumpWidget(defaultStructure(MovieCard(onTap: (getMovies) {}, actualMovie: getMovies().first, isSearch: false))));
    expect(find.byType(MovieCard), findsOneWidget);
  });
}