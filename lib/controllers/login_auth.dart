class LoginAuth {
  static const String _staticUser = '1';
  static const String _staticPassword = '1';

  /// Valida se o usuário e senha informados correspondem aos valores fixos.
  static bool validate(String user, String password) {
    return user.trim() == _staticUser && password == _staticPassword;
  }
}
