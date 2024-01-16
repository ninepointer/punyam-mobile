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

  Future<RepoResponse<DevataListResponse>> getAllDeviDevta() async {
    String apiURL = AppUrls.godList;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: DevataListResponse.fromJson(response));
  }

  Future<RepoResponse<AllMandirResponse>> getMandirBygodName(
      String poojaId) async {
    String apiURL = AppUrls.mandirListBygod(poojaId);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: AllMandirResponse.fromJson(response));
  }

  Future<RepoResponse<TempleNearMeResponse>> getNearByMandirs(
      String lat, String long) async {
    String apiURL = AppUrls.nearbyMandirs(lat, long);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: TempleNearMeResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> addToFavirouteMandir(String id) async {
    String apiURL = '${AppUrls.addtoFavirouteMandirs}/$id';
    var response = await service.patchAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<DashboardCarouselResponse>> getCarousel() async {
    String apiURL = AppUrls.dashboardCarousel;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: DashboardCarouselResponse.fromJson(response));
  }

  Future<RepoResponse<AllMandirResponse>> searchMandirByString(
      String? value) async {
    String apiURL = AppUrls.searchMandir;
    var query = {'search': value, 'page': 1, 'size': 20};
    var response = await service.getAuth(path: apiURL, query: query);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: AllMandirResponse.fromJson(response));
  }
}
