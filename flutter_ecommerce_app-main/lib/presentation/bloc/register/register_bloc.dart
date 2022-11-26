import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store/domain/entites/register.dart';
import 'package:store/domain/usecases/post_register.dart';

part 'register_event.dart';
part 'register_state.dart';

PostRegister register = PostRegister();

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<EventRegister>((event, emit) async {
      try {
        emit(LoadingRegister());

        await register.call('/api/register', event.register);
        emit(SuccessRegister());
      } catch (e) {
        emit(FailureRegister(errorMesage: e.toString()));
      }
    });
  }
}
