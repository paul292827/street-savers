import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class StreetSaversFirebaseUser {
  StreetSaversFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

StreetSaversFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<StreetSaversFirebaseUser> streetSaversFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<StreetSaversFirebaseUser>(
            (user) => currentUser = StreetSaversFirebaseUser(user));
