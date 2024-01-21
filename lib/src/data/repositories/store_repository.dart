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

  Future<RepoResponse<StoreCatagoryResponse>> getAllCategories() async {
    String apiURL = AppUrls.storeCatagory;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: StoreCatagoryResponse.fromJson(response));
  }

  Future<RepoResponse<StoreCatagoryWiseItemsResponse>> getAllItemCatagoryWise(
      String? catId) async {
    String apiURL = AppUrls.storeCatagoryWiseItem(catId);
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: StoreCatagoryWiseItemsResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> addToCart(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.StoreAddtoCart;
    var response = await service.postAuth(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> removeFromCart(
      Map<String, dynamic> data) async {
    String apiURL = AppUrls.StoreRemovetoCart;
    var response = await service.postAuth(path: apiURL, data: data);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<StoreCartResponse>> getAllItemCartItems() async {
    String apiURL = AppUrls.getCartItems;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: StoreCartResponse.fromJson(response));
  }
}
