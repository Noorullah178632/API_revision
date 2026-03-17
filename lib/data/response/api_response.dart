import 'package:api_revision/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status, this.data, this.message);
  //make three named constrctor for the status
  ApiResponse.completed(this.message) : status = Status.COMPLETED;
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.error(this.data) : status = Status.ERROR;

  //make a override function to get all the value
  @override
  String toString() {
    return "Status:$status \n Message : $message \n Data: $data";
  }
}
