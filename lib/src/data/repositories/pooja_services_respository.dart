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

  Future<RepoResponse<SelectPoojaByIdResponse>> getPoojaServiceByid(
      String poojaId) async {
    String apiURL = AppUrls.individualPoojaById(poojaId);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: SelectPoojaByIdResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getConfirmationBooking(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.bookingConfirmation;
    var response = await service.postAuth(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<IncreasePoojaCountPetchResponse>> increasePoojaCount(
      String id) async {
    String apiURL = '${AppUrls.increasePoojaCount}/$id';
    var response = await service.patchAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(
            data: IncreasePoojaCountPetchResponse.fromJson(response));
  }
}
