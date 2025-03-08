import 'package:almanaraa/UI/shared/enum/operation_type.dart';
import 'package:almanaraa/UI/shared/enum/request_status.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  var requestStatus = RequestStatus.DEFAULT.obs;
  var operationType = OperationType.NONE.obs;
  RxList<OperationType> operationTypeList = <OperationType>[].obs;
  set setRequestStatus(RequestStatus value) {
    requestStatus.value = value;
  }

  bool get isLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.NONE);

  set setOperationType(OperationType value) {
    operationType.value = value;
  }
}
