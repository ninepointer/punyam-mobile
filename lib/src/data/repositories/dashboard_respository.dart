import '../../base/base.dart';
import '../../core/core.dart';
import '../data.dart';

class DashboardRepository extends BaseRepository {
  Future<RepoResponse<DashboardCarouselResponse>> getDashboardCarousel() async {
    String apiURL = AppUrls.dashboardCarousel;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: DashboardCarouselResponse.fromJson(response));
  }

  Future<RepoResponse<GetLocationByLatAndLongResponse>> getLocationByLongAndLat(
      String lat, String long) async {
    String apiURL = AppUrls.getLocationByLongLat(lat, long);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(
            data: GetLocationByLatAndLongResponse.fromJson(response));
  }

  Future<RepoResponse<PoojaCategoryResponse>> getHomePagePoojaList() async {
    String apiURL = AppUrls.poojalistHomepage;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: PoojaCategoryResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> addUserAddress() async {
    String apiURL = AppUrls.addUserAddressUrl;
    var response = await service.patchAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> removeUserAddress(String id) async {
    String apiURL = AppUrls.removeUserAddressUrl(id);
    var response = await service.patchAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> editUserAddress(String id) async {
    String apiURL = AppUrls.editUserAddressUrl(id);
    var response = await service.patchAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }
}
