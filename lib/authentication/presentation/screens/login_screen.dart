import 'package:auto_route/auto_route.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gap/gap.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:profinder/shared/routing/app_router.gr.dart';
import 'package:profinder/shared/theme/app_colors.dart';

import '../../../shared/business_logic/cubit/application_cubit.dart';
import '../../../shared/service_locator.dart';
import '../../../shared/widgets/app_snackbar.dart';
import '../../business_logic/auth/auth_cubit.dart';
import '../../data/repositories/auth_repository.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController pwdController;
  late AuthCubit authCubit;

  late FocusNode emailFocusNode;
  late FocusNode pwdFocusNode;

  @override
  void initState() {
    super.initState();
    authCubit = AuthCubit(
      repository: getIt.get<AuthRepository>(),
    );
    emailController = TextEditingController();
    pwdController = TextEditingController();

    emailFocusNode = FocusNode();
    pwdFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: authCubit,
      listener: (context, state) {
        if (state is LoginFailure) {
          context.loaderOverlay.hide();
          AppSnackBar.showError(
            message: state.message,
            context: context,
          );
        }

        if (state is LoginLoading) {
          context.loaderOverlay.show();
        }

        if (state is LoginSuccess) {
          context.loaderOverlay.hide();
          context.read<ApplicationCubit>().setUser(state.user!);
          context.router.pushAndPopUntil(
            const ApplicationRoute(),
            predicate: (router) => false,
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: SinCosineWaveClipper(
                      horizontalPosition: HorizontalPosition.right,
                    ),
                    child: Container(
                      height: 300,
                      color: AppColors.secondary.withOpacity(0.3),
                    ),
                  ),
                  ClipPath(
                    clipper: SinCosineWaveClipper(
                      horizontalPosition: HorizontalPosition.left,
                    ),
                    child: Container(
                      height: 295,
                      color: AppColors.primary.withOpacity(0.7),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      height: 298,
                      color: AppColors.primary.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        "Hello",
                        style: TextStyle(
                          fontSize: 65,
                          fontWeight: FontWeight.w900,
                          color: AppColors.grayTitle,
                        ),
                      ),
                      subtitle: Text(
                        "Sign in to your account",
                        style: TextStyle(
                          color: AppColors.grayText,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.gray200,
                            blurRadius: 20,
                            offset: const Offset(0, 0),
                          )
                        ],
                      ),
                      child: TextFormField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.grayText,
                          ),
                          hintText: "user@gmail.com",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.gray200,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          filled: true,
                          fillColor: AppColors.white,
                        ),
                      ),
                    ),
                    const Gap(40),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.gray200,
                            blurRadius: 20,
                            offset: const Offset(0, 0),
                          )
                        ],
                      ),
                      child: TextFormField(
                        controller: pwdController,
                        focusNode: pwdFocusNode,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.grayText,
                          ),
                          hintText: "#Pw7",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.gray200,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          filled: true,
                          fillColor: AppColors.white,
                        ),
                        obscureText: true,
                        obscuringCharacter: '•',
                      ),
                    ),
                    const Gap(15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot your password ?",
                          style: TextStyle(
                            color: AppColors.grayText,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    FilledButton(
                      onPressed: () {
                        authCubit.login(
                          email: emailController.text,
                          password: pwdController.text,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Gap(20),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: AppColors.grayText),
                        children: [
                          const TextSpan(text: "Don't have an account ? "),
                          TextSpan(
                              text: 'Create',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.router.pushAndPopUntil(
                                    const RegisterRoute(),
                                    predicate: (router) => false,
                                  );
                                }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
