class ConfigEnv {
  static String imagePath = 'https://image.tmdb.org/t/p/w500';
  static String basePath = 'https://api.themoviedb.org/3/';
  static String get apiKey => const String.fromEnvironment('API_KEY');
}
