import '../../base/base.dart';
import '../../core/core.dart';
import '../data.dart';

class MandirRespository extends BaseRepository {
  Future<RepoResponse<AllMandirResponse>> getPopularTemples(
      String lat, String long) async {
    String apiURL = AppUrls.getPopularMandirs(lat, long);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: AllMandirResponse.fromJson(response));
  }

  Future<RepoResponse<TempleNearMeResponse>> getAllPopularTemplesByDistance(
      String lat, String long) async {
    String apiURL = AppUrls.getPopularMandirByDistanceMandirs(lat, long, '');
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: TempleNearMeResponse.fromJson(response));
  }

  Future<RepoResponse<TempleNearMeResponse>>
      getPopularTemplesBySearchByDistance(
          String lat, String long, String search) async {
    String apiURL =
        AppUrls.getPopularMandirByDistanceMandirs(lat, long, search);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: TempleNearMeResponse.fromJson(response));
  }

  Future<RepoResponse<TempleNearMeResponse>> getDhamMandirByDistance(
      String lat, String long) async {
    String apiURL = AppUrls.getDhamByDistanceMandirs(lat, long, '');
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: TempleNearMeResponse.fromJson(response));
  }

  Future<RepoResponse<TempleNearMeResponse>> getDhamMandirBySearchByDistance(
      String lat, String long, String search) async {
    String apiURL = AppUrls.getDhamByDistanceMandirs(lat, long, search);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: TempleNearMeResponse.fromJson(response));
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

  Future<RepoResponse<TempleNearMeResponse>> getMandirBygodName(
      String poojaId, String lat, String long, String search) async {
    String apiURL = AppUrls.mandirListBygod(poojaId, lat, long, search);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: TempleNearMeResponse.fromJson(response));
  }

  Future<RepoResponse<TempleNearMeResponse>> getNearByMandirsByDistance(
      String lat, String long) async {
    String apiURL = AppUrls.nearbyMandirs(lat, long, '');
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: TempleNearMeResponse.fromJson(response));
  }

  Future<RepoResponse<TempleNearMeResponse>> getNearByMandirsBySearchByDistance(
      String lat, String long, String search) async {
    String apiURL = AppUrls.nearbyMandirs(lat, long, search);
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

  Future<RepoResponse<GenericResponse>> removeToFavirouteMandir(
      String id) async {
    String apiURL = '${AppUrls.removetoFavirouteMandirs}/$id';
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

  Future<RepoResponse<DashboardCarouselResponse>> getDhamCarousel() async {
    String apiURL = AppUrls.dhamCarausal;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: DashboardCarouselResponse.fromJson(response));
  }

  Future<RepoResponse<DashboardCarouselResponse>>
      getPopularMandirCarousel() async {
    String apiURL = AppUrls.popularMandirCarausal;
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

  Future<RepoResponse<TempleNearMeResponse>> getAllTrandingMandirs(
      String lat, String long) async {
    String apiURL = AppUrls.getTrandingMandirs(lat, long);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: TempleNearMeResponse.fromJson(response));
  }

  Future<RepoResponse<TempleNearMeResponse>> getAllfaviroutesMandirs(
      String lat, String long) async {
    String apiURL = AppUrls.getFavirouteMandirs(lat, long);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: TempleNearMeResponse.fromJson(response));
  }
}
