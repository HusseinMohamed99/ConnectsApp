import 'package:connects_app/core/networking/api_constants.dart';
import 'package:connects_app/features/users/data/models/single_user_response.dart';
import 'package:connects_app/features/users/data/models/users_list_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.getSingleUser)
  Future<SingleUserResponse> getSingleUser(@Path('id') int id);

  @GET(ApiConstants.getAllUsers)
  Future<UsersListResponse> getAllUsers(@Query('page') int page);

}