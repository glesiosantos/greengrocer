import 'package:greengrocer/src/config/endpoints_constants.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      uri: EndpointsConstant.signIn,
      method: HttpMethods.post,
      body: {"email": email, "password": password},
    );

    if (result != null) {
      final user = UserModel.fromMap(result['result']);
      print(user.toString());
    } else {
      print('SignIn não funcionando');
      print(result);
    }
  }
}
