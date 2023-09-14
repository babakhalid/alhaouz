
import 'package:alhaouz/models/association.dart';

import '../../models/douar.dart';
import 'network_utils.dart';

/// GET method demo
Future<Douar> getDouarList(String filter, int page, String zone) async {
  String url = "";
  if(zone!="0"){
    url = "zone=$zone";
  }
  print(page);
  return Douar.fromJson(await (handleResponse(await getRequest('api/doar?page=$page&$url'))));
}

/// GET all douar
Future<Douar> getAllDouarList() async {
  return Douar.fromJson(await (handleResponse(await getRequest('api/doar'))));
}

/// GET method demo
Future<Associations> getAssociationList() async {
  return Associations.fromJson(await (handleResponse(await getRequest('api/association'))));
}