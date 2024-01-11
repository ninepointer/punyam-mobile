import '../../base/base.dart';
import '../../core/core.dart';
import '../data.dart';

class PoojaServicesRespository extends BaseRepository {
  Future<RepoResponse<DashboardCarouselResponse>> getCarousel() async {
    String apiURL = AppUrls.dashboardCarousel;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: DashboardCarouselResponse.fromJson(response));
  }

  Future<RepoResponse<PoojaCategoryResponse>> getPoojaCatagory() async {
    String apiURL = AppUrls.poojaCatagory;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: PoojaCategoryResponse.fromJson(response));
  }
}
