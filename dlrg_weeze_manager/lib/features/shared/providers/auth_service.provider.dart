import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.provider.g.dart';

@riverpod
class AuthServiceNotifier extends _$AuthServiceNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  User? build() => _auth.currentUser;

  User? get currentUser => _auth.currentUser;

  Future<User?> signInWithGoogle() async {
    try {
      state = const AsyncLoading() as User?; // Ladezustand setzen

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      state = AsyncData(userCredential.user) as User?; // Erfolgszustand setzen
      return userCredential.user;
    } catch (e, st) { // Hier die Änderung: fange den StackTrace mit 'st'
      state = AsyncError(e, st) as User?; // Hier die Änderung: übergebe den StackTrace
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading() as User?; // Ladezustand setzen
    await _auth.signOut();
    await GoogleSignIn().signOut();
    state = const AsyncData(null) as User?; // Erfolgszustand mit null setzen (abgemeldet)
  }
}
