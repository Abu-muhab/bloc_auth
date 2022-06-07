import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test/models/user.dart';
import 'package:test/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    initAuthState();

    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        login(event.email, event.password);
      }

      if (event is LogoutEvent) {
        logout();
      }
    });
  }

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final authService = AuthService();
      final user = await authService.login(email, password);
      emit(AuthLoggedIn(user: user));
    } catch (err) {
      emit(AuthErrorState(errorMessage: err.toString()));
    }
  }

  Future<void> logout() async {
    final authService = AuthService();
    await authService.logout();
    emit(AuthInitial());
  }

  Future<void> initAuthState() async {
    emit(AuthLoading());
    final authService = AuthService();
    final user = await authService.getLoggedinUserData();
    if (user != null) {
      emit(AuthLoggedIn(user: user));
    } else {
      emit(AuthInitial());
    }
  }
}
