class LoginAuth {
  static const String _staticUser = 'admin';
  static const String _staticPassword = '123456';

  static bool validate(String user, String password) {
    return user.trim() == _staticUser && password == _staticPassword;
  }
}
