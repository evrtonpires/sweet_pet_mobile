abstract class IAuthRepository {
  Future getUser();

  Future getLogin();

  Future getGoogleLogin();

  Future getFacebookLogin();

  Future<String> getToken();
}
