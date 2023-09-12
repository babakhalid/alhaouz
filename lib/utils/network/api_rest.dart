
import '../../models/douar.dart';
import 'network_utils.dart';

/// GET method demo
Future<Douar> getDouarList(int page) async {
  print(page);
  return Douar.fromJson(await (handleResponse(await getRequest('api/doar?page=$page'))));
}

