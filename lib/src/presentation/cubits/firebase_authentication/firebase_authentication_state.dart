part of 'firebase_authentication_cubit.dart';

abstract class FirebaseAuthenticationState extends Equatable {
  final User? firebaseUser;

  const FirebaseAuthenticationState({this.firebaseUser});

  @override
  List<Object?> get props => [firebaseUser];
}

class AuthInitial extends FirebaseAuthenticationState {}

class Authenticated extends FirebaseAuthenticationState {
  final User firebaseUser;
  Authenticated(this.firebaseUser);
}

class Unauthenticated extends FirebaseAuthenticationState {}
