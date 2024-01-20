import '../../base/base.dart';
import '../../core/core.dart';
import '../data.dart';

class StoreRepository extends BaseRepository {
   Future<RepoResponse<DashboardCarouselResponse>> getDashboardCarousel() async {
    String apiURL = AppUrls.dashboardCarousel;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: DashboardCarouselResponse.fromJson(response));
  }
  
}
