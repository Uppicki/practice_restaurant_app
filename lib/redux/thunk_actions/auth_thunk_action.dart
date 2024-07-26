import 'package:dio/dio.dart';
import 'package:practice/app/init_api_client.dart';
import 'package:practice/payload/requests/email_part1_request/email_part1_request.dart';
import 'package:practice/payload/requests/email_part2_request/email_part2_request.dart';
import 'package:practice/payload/requests/login_request/login_request.dart';
import 'package:practice/payload/requests/registration_request/registration_request.dart';
import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';


ThunkAction sendEmail(String email) => (Store store) async {
  final authClient = ApiClient.client.authClient;

  try{
    final response = await authClient.sendEmail(
        request: EmailPart1Request(email: email)
    );
    store.dispatch(SendEmail(email: email));
  } on DioException catch (e) {
    final error = e.response?.data['email'][0];
    store.dispatch(ReturnErrorAction(error: error));
  } catch (e) {
  }
};

ThunkAction sendCode(String email, String code) => (Store store) async {
  final authClient = ApiClient.client.authClient;

  try{
    final response = await authClient.sendCode(
        request: EmailPart2Request(email: email, code: code)
    );
    store.dispatch(EmailConfirmAction(email: email));
  } on DioException catch (e) {
    final error = e.response?.data['error'];
    store.dispatch(ReturnErrorAction(error: error));
  } catch (e) {
  }
};

ThunkAction regUser({
  required String email,
  required String password,
  required String repeatPassword,
  required String firstName,
  required String lastName,
}) => (Store store) async {
  final authClient = ApiClient.client.authClient;
  
  if (password.length < 8) {
    store.dispatch(ReturnErrorAction(error: 'Пароль должен содержать минимум 8 символов'));
  } else if (password != repeatPassword) {
    store.dispatch(ReturnErrorAction(error: 'Пароли не совпадают'));
  } else {
    try{
      final response = await authClient.registerUser(
          request: RegistrationRequest(
              email: email,
              password: password,
            firs_name: firstName,
            last_name: lastName,
          )
      );
      store.dispatch(const RegistrationAction());
    } on DioException catch (e) {
      final error = e.response?.data['error'];
      store.dispatch(ReturnErrorAction(error: error));
    } catch (e) {
    }
  }
};

ThunkAction login({
  required String email,
  required String password,
}) => (Store store) async {
  final apiClient = ApiClient.client;

  try{
    final response = await apiClient.authClient.loginUser(
        request: LoginRequest(
          email: email,
          password: password,
        )
    );
    final profile = await apiClient.setTokens(response);
    store.dispatch(AuthorizationAction(
        profile: profile
    ));
  } on DioException catch (e) {
    final error = e.response?.data['error'];
    store.dispatch(ReturnErrorAction(error: error));
  } catch (e) {
  }
};
