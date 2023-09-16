
import 'package:alhaouz/models/all_doars.dart';
import 'package:alhaouz/models/association.dart';

import '../../models/douar.dart';
import 'network_utils.dart';

/// GET method demo
Future<Douar> getDouarList(String filter, int page, String zone) async {
  String url = "";
  if(zone!="0"){
    url = "&zone=$zone";
  }
  if(filter != ""){
    url = "&status=$filter";
  }
  print(page);
  return Douar.fromJson(await (handleResponse(await getRequest('api/doar?page=$page&$url'))));
}

/// GET all douar
Future<AllDoars> getAllDouarList() async {
  return AllDoars.fromJson(await (handleResponse(await getRequest('api/all-doar'))));
}

/// GET all demo
Future<Associations> getAssociationList(int page) async {
  return Associations.fromJson(await (handleResponse(await getRequest('api/association?page=$page'))));
}

/// GET all demo
Future<Associations> getAssociationsList() async {
  return Associations.fromJson(await (handleResponse(await getRequest('api/all-association'))));
}
