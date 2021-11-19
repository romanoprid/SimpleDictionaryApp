import 'dart:io';

import 'package:dictionary/model/word_response.dart';
import 'package:dictionary/service/http_service.dart';

class WordRepository {
  Future<List<WordResponse>?> getWordsFromDictionary(String query) async {
    try {
      final response = await HttpService.getRequest("en_US/$query");

      if (response.statusCode == 200) {
        final result = wordResponseFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } on SocketException {
      rethrow;
    } on HttpException {
      rethrow;
    } on FormatException {
      rethrow;
    }
  }
}
