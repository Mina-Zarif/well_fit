import 'package:bloc/bloc.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
}
