class AuthService {
  static final List<_User> _users = [];
  static _User? _current;

  static bool register(String name, String email, String password) {
    if (_users.any((u) => u.email == email)) return false;
    _users.add(_User(name, email, password));
    return true;
  }

  static bool login(String email, String password) {
    for (final user in _users) {
      if (user.email == email && user.password == password) {
        _current = user;
        return true;
      }
    }
    return false;
  }

  static String? get currentUserName => _current?.name;
}

class _User {
  final String name;
  final String email;
  final String password;
  _User(this.name, this.email, this.password);
}
