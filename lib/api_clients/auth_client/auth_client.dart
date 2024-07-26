import 'package:dio/dio.dart';
import 'package:practice/api_clients/auth_client/auth_url.dart';
import 'package:practice/payload/empty_payload.dart';
import 'package:practice/payload/requests/email_part1_request/email_part1_request.dart';
import 'package:practice/payload/requests/email_part2_request/email_part2_request.dart';
import 'package:practice/payload/requests/login_request/login_request.dart';
import 'package:practice/payload/requests/refresh_token_request/refresh_token_request.dart';
import 'package:practice/payload/requests/registration_request/registration_request.dart';
import 'package:practice/payload/responses/login_response/login_response.dart';
import 'package:practice/payload/responses/profile_info_response/profile_info_response.dart';
import 'package:practice/payload/responses/refresh_response/refresh_response.dart';
import 'package:retrofit/http.dart';





part 'auth_client.g.dart';


@RestApi()
abstract class AuthClient{
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST(AuthUrl.sendEmail)
  Future<EmptyPayload> sendEmail({
    @Body() required EmailPart1Request request,
  });
  
  @POST(AuthUrl.sendCode)
  Future<EmptyPayload> sendCode({
   @Body() required EmailPart2Request request, 
  });

  @PATCH(AuthUrl.register)
  Future<EmptyPayload> registerUser({
    @Body() required RegistrationRequest request,
  });


  @POST(AuthUrl.login)
  Future<LoginResponse> loginUser({
   @Body() required LoginRequest request,
 });


  @POST(AuthUrl.refresh)
  Future<RefreshResponse> refreshToken({
    @Body() required RefreshRequest request,
  });


  @GET(AuthUrl.profile)
  Future<ProfileInfoResponse> getProfile();


}