import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigEnv {
  static String imagePath = 'https://image.tmdb.org/t/p/w500';
  static String basePath = 'https://api.themoviedb.org/3/';
  static String apiKey = dotenv.env['API_KEY']!;
}