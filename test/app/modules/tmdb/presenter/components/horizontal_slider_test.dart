import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/horizontal_slider.dart';
import 'package:tmdb_app/app/modules/tmdb/presenter/components/movie_card.dart';

import '../../utils/default_structure.dart';
import '../../utils/mock.dart';

void main() {
  testWidgets('Should render a Horizontal Slider List ', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async => await tester.pumpWidget(defaultStructure(HorizontalSlider(movies: getMovies(), onTap: (getMovies) {}))));
    expect(find.byType(HorizontalSlider), findsOneWidget);
    expect(find.byType(MovieCard), findsNWidgets(2));
  });

}