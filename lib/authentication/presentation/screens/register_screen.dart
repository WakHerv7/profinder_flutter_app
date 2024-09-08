import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:profinder/authentication/business_logic/auth/auth_cubit.dart';
import 'package:profinder/authentication/data/repositories/auth_repository.dart';
import 'package:profinder/shared/business_logic/cubit/application_cubit.dart';
import 'package:profinder/shared/routing/app_router.gr.dart';
import 'package:profinder/shared/service_locator.dart';
import 'package:profinder/shared/widgets/app_snackbar.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController fistNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;
  late TextEditingController pwdController;
  late AuthCubit authCubit;

  @override
  void initState() {
    super.initState();
    authCubit = AuthCubit(
      repository: getIt.get<AuthRepository>(),
    );
    emailController = TextEditingController();
    fistNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    pwdController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    fistNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: authCubit,
      listener: (context, state) {
        if (state is RegisterFailure) {
          context.loaderOverlay.hide();
          AppSnackBar.showError(
            message: state.message,
            context: context,
          );
        }

        if (state is RegisterLoading) {
          context.loaderOverlay.show();
        }

        if (state is RegisterSuccess) {
          context.loaderOverlay.hide();
          context.read<ApplicationCubit>().setUser(state.user!);
          context.router.pushAndPopUntil(
            const ApplicationRoute(),
            predicate: (router) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: ListView(
          children: [
            TextFormField(
              controller: fistNameController,
              decoration: const InputDecoration(
                label: Text("First Name"),
                hintText: "First Name",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                label: Text("Last Name"),
                hintText: "Last Name",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text("Email"),
                hintText: "Email",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                label: Text("Phone Number"),
                hintText: "Phone Number",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: pwdController,
              decoration: const InputDecoration(
                label: Text("Password"),
                hintText: "Password",
              ),
            ),
            const Gap(40),
            FilledButton(
              onPressed: () {
                authCubit.register(
                  firstName: fistNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  phoneNumber: phoneController.text,
                  password: pwdController.text,
                );
              },
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
