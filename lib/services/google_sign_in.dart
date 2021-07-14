import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInServices {
  static final GoogleSignInServices _singleton =
      GoogleSignInServices._internal();

  factory GoogleSignInServices() {
    _singleton._googleSignIn.onCurrentUserChanged.listen(
      (account) {
        _singleton._currentUser = account;

        if (_singleton._currentUser != null) {
          // Initialize the _authHeaders with the new user credentials
          _singleton._authHeaders = _singleton._currentUser?.authHeaders;
        }
      },
    );
    return _singleton;
  }

  GoogleSignInServices._internal();

  GoogleSignInAccount? _currentUser;
  Future<Map<String, String>>? _authHeaders;

  final _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'profile',
      'https://www.googleapis.com/auth/photoslibrary',
      'https://www.googleapis.com/auth/photoslibrary.sharing'
    ],
  );

  GoogleSignInAccount? get user => _currentUser;
  Future<Map<String, String>>? get authHeaders => _authHeaders;

  bool isLoggedIn() {
    return _currentUser != null;
  }

  Future<GoogleSignInAccount?> signIn() => _googleSignIn.signIn();

  Future<GoogleSignInAccount?> signInSilently() =>
      _googleSignIn.signInSilently();

  Future<void> signOut() => _googleSignIn.disconnect();
}
