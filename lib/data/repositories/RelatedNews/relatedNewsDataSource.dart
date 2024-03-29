// ignore_for_file: file_names

import 'package:news/utils/api.dart';
import 'package:news/utils/strings.dart';

class RelatedNewsRemoteDataSource {
  Future<dynamic> getRelatedNews(
      {required String userId, required String langId, String? catId, String? subCatId, String? latitude, String? longitude, required String offset, required String perPage}) async {
    try {
      final body = {USER_ID: userId, LANGUAGE_ID: langId, OFFSET: offset, LIMIT: perPage};
      if (subCatId != "0" && subCatId != '') {
        body[SUBCAT_ID] = subCatId!;
      } else {
        body[CATEGORY_ID] = catId!;
      }
      if (latitude != null && latitude != "null") body[LATITUDE] = latitude;
      if (longitude != null && longitude != "null") body[LONGITUDE] = longitude;

      final result = await Api.post(body: body, url: Api.getNewsByCatApi);
      return result;
    } catch (e) {
      throw ApiMessageAndCodeException(errorMessage: e.toString());
    }
  }
}
