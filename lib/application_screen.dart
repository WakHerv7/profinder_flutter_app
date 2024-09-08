import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profinder/shared/business_logic/cubit/application_cubit.dart';

@RoutePage()
class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationCubit, ApplicationState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${state.user?.firstName}"),
                Text("${state.user?.lastName}"),
                Text("${state.user?.email}"),
                Text("${state.user?.phoneNumber}"),
                Text("${state.user?.firstName}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
