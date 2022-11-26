import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store/domain/entites/login.dart';
import 'package:store/domain/usecases/post_login.dart';

part 'login_event.dart';
part 'login_state.dart';

PostLogin login = PostLogin();

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<EventLogin>(
      (event, emit) async {
        try {
          emit(LoadingLogin());

          await login.call('/api/login', event.login);
          emit(SuccessLogin());
        } catch (e) {
          emit(FailureLogin(errorMesage: e.toString()));
        }
      },
    );
  }
}
