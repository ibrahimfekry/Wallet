import 'package:expense_app/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialStates());

  static LoginCubit get(context)=>BlocProvider.of(context);

  bool isPasswordVisibility = true;

  changePasswordVisibility(){
    isPasswordVisibility = !isPasswordVisibility;
    emit(ChangePasswordVisibility());
  }
}