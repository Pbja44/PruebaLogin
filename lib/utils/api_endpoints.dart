class ApiEndPoints {
  static  String baseUrl = 'https://staging.brokr.com/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
  static String contentType = "application/json; charset=UTF-8";
  static String auth = "Bearer 4|HpKlxwsfUCcvcJnCGql5nWM7WdkrJwZTn98IDgN8";

}

class _AuthEndPoints {
  final String loginEmail = 'api/auth/login';
  final String checkEmail = 'api/check_email';
  final String registerEmail = 'api/auth/register';
}
