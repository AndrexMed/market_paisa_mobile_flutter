import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String baseApiUrl = dotenv.env['BASE_API_URL'] ?? 'No base url found';
}
