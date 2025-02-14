import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.provider.g.dart';

@riverpod
class AuthServiceNotifier extends _$AuthServiceNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  AsyncValue<User?> build() => const AsyncLoading(); // Initialzustand ist Loading

  Future<User?> signInWithGoogle() async {
    try {
      state = const AsyncLoading(); // Korrekt: Setze den Zustand auf Loading

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      state = AsyncData(userCredential.user); // Korrekt: Setze den Zustand auf Data
      return userCredential.user;
    } catch (e, st) {
      state = AsyncError(e, st); // Korrekt: Setze den Zustand auf Error
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading(); // Korrekt: Setze den Zustand auf Loading
    await _auth.signOut();
    await GoogleSignIn().signOut();
    state = const AsyncData(null); // Korrekt: Setze den Zustand auf Data (null)
  }
}
