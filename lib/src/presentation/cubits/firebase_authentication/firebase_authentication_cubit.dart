import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_gym_coach/src/config/router/app_router.dart';

import 'package:my_gym_coach/src/domain/models/app_user.dart';
import 'package:my_gym_coach/src/domain/repositories/user_repository.dart';
import 'package:my_gym_coach/src/locator.dart';
import 'package:my_gym_coach/src/presentation/cubits/base/base_cubit.dart';
import 'package:my_gym_coach/src/utils/constants/general.dart';
import 'package:my_gym_coach/src/utils/constants/strings.dart';
import 'package:my_gym_coach/src/utils/store/app-store.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:uuid/uuid.dart';

part 'firebase_authentication_state.dart';

class FirebaseAuthenticationCubit
    extends BaseCubit<FirebaseAuthenticationState, User?> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserRepository _apiRepository;
  User? firebaseUser;

  FirebaseAuthenticationCubit(this._apiRepository) : super(AuthInitial(), null);

  void checkAuthenticationStatus() {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        emit(Authenticated(user));
        locator<AppStore>().setGoogleUserEmail(email: user.email);
        locator<AppStore>().setGoogleUserName(name: user.displayName);
        locator<AppStore>().setGoogleUserPhotoUrl(photoUrl: user.photoURL);
        appRouter.navigate(const DashboardViewRoute());
        // appRouter.replaceAll([const DashboardViewRoute()]);
      } else {
        emit(Unauthenticated());
      }
    });
  }

  Future<User?> signIn() async {
    AppUser? user;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        firebaseUser = userCredential.user;
        user = AppUser(
            id: const Uuid().v4(),
            name: firebaseUser?.displayName,
            email: firebaseUser?.email,
            photoURL: firebaseUser?.photoURL);
        this._apiRepository.saveUser(user);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          showToast(firebase_account_already_exists);
        } else if (e.code == 'invalid-credential') {
          showToast(
            firebase_authentication_error,
          );
        }
      } catch (e) {
        showToast(
          firebase_authentication_error,
        );
      }
      return firebaseUser;
    } else {
      emit(Unauthenticated());
      showToast(
        firebase_authentication_error,
      );
      throw new Exception();
    }
  }

  Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    String userEmail = await getStringAsync(USER_EMAIL);
    if (userEmail != "") {
      var teste = await googleSignIn
          .signOut()
          .catchError((error) => showToast('Error signing out. Try again.'));

      await _firebaseAuth.signOut();
      var user = await this._apiRepository.getSavedUser(userEmail);
      this._apiRepository.removeUser(user!);
      await locator<AppStore>().setValueGoogleSignIn(val: false);
      await locator<AppStore>().setGoogleUserEmail(email: "");
      await locator<AppStore>().setGoogleUserName(name: "");
      await locator<AppStore>().setGoogleUserPhotoUrl(photoUrl: "");
      appRouter.replaceAll([SignInViewRoute()]);
    } else {
      showToast(user_already_signed_out);
    }
  }
}
