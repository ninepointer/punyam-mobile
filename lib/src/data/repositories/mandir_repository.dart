import '../../base/base.dart';
import '../../core/core.dart';
import '../data.dart';

class MandirRespository extends BaseRepository {
  Future<RepoResponse<AllMandirResponse>> getAllTemples() async {
    String apiURL = AppUrls.getAllMandirs;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: AllMandirResponse.fromJson(response));
  }

  Future<RepoResponse<AllMandirResponse>> getPopularTemples() async {
    String apiURL = AppUrls.getPopularMandirs;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: AllMandirResponse.fromJson(response));
  }

  Future<RepoResponse<AllMandirResponse>> getDhamTemples() async {
    String apiURL = AppUrls.getDhamMandirs;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: AllMandirResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> addToFavirouteMandir(String id) async {
    String apiURL = '${AppUrls.addtoFavirouteMandirs}/$id';
    var response = await service.patchAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }
}
