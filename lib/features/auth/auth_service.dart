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
        static _User? get currentUser => _current;

  static String? get currentUserName => _current?.name;
}

class _User {
  String _name;
  String _email;
  String _password;

  _User(this._name, this._email, this._password);

  String get name => _name;
  set name(String value) => _name = value;

  String get email => _email;
  set email(String value) => _email = value;

  String get password => _password;
  set password(String value) => _password = value;
}

