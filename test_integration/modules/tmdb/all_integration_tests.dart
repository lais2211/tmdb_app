import './search_page_integrations_test.dart' as search_page_integrations_test;
import './home_page_integration_test.dart' as home_page_integration_test;
import './more_movies_page_integration_test.dart'
    as more_movies_page_integration_test;
import './description_page_integration_test.dart'
    as description_page_integration_test;

void main() async {
  description_page_integration_test.main();
  home_page_integration_test.main();
  more_movies_page_integration_test.main();
  search_page_integrations_test.main();
}
