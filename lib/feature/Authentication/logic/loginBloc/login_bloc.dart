import '../../../../../../core/common/shared/shared_imports.dart'; // Import shared utilities

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController userLoginEmailAddress = TextEditingController();
  final TextEditingController userLoginPassword = TextEditingController();
  final context = instance<GlobalKey<NavigatorState>>().currentState!.context;

  final loginFormKey = GlobalKey<FormState>();

  final AuthenticationRepositoryImplement _loginRepository;

  bool showPass = true;
  bool isButtonInVaildator = false;

  LoginBloc(this._loginRepository) : super(const _Initial()) {
    on<UserLoginButton>(loginButton);

    on<LoginEvent>((event, emit) async {
      if (event is UserLoginEmailAddress) {
        await _validateLoginButton(event, emit);

        if (!AppRegex.isEmailValid(event.value)) {
          emit(LoginState.userLoginEmailAddress(
              context.translate(AppStrings.pleaseEnterValidEmail)));
        } else {
          emit(const LoginState.userLoginEmailAddress(""));
        }
      }

      if (event is UserLoginPassword) {
        await _validateLoginButton(event, emit);

        if (!AppRegex.isPasswordValid(event.value)) {
          emit(LoginState.userLoginPassword(
              context.translate(AppStrings.pleaseEnterValidPassword)));
        }
      }

      if (event is UserShowLoginPassword) {
        showPass = !showPass;
        emit(LoginState.showUserPassword(showPass));
      }
    });
  }

  Future<void> _validateLoginButton(
      LoginEvent event, Emitter<LoginState> emit) async {
    if (!AppRegex.isPasswordValid(userLoginPassword.text) ||
        !AppRegex.isEmailValid(userLoginEmailAddress.text)) {
      isButtonInVaildator = false;
    } else {
      isButtonInVaildator = true;
    }

    emit(LoginState.buttonLoginVaildation(isButtonInVaildator));
  }

  Future<void> loginButton(LoginEvent event, Emitter<LoginState> emit) async {
    await event.whenOrNull(
      userLoginButton: () async {
        emit(const LoginState.loading());

        final response = await _loginRepository.loginRepo(
          LoginRequestBody(
            email: userLoginEmailAddress.text.trim(),
            password: userLoginPassword.text.trim(),
          ),
        );

        response.when(
          success: (loginResponse) async {
            emit(LoginState.suceess(loginResponse));
          },
          failure: (error) {
            emit(
              LoginState.error(error),
            );
          },
        );
      },
    );
  }
}
