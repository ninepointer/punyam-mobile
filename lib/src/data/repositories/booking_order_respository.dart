import '../../base/base.dart';
import '../../core/core.dart';
import '../data.dart';

class BookingOrderRepository extends BaseRepository {
  Future<RepoResponse<GatAllBookingResponse>> getAllBookingOrders() async {
    String apiURL = AppUrls.getAllUserBooking;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GatAllBookingResponse.fromJson(response));
  }

  Future<RepoResponse<StoreCartOrderResponse>> getAllOrderItems() async {
    String apiURL = AppUrls.getStoreOrder;
    var response = await service.getAuth(path: apiURL);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: StoreCartOrderResponse.fromJson(response));
  }
}
