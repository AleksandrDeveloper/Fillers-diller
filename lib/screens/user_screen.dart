import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user/user_bloc.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/title_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoading) {
        return const Scaffold(
          appBar: AppBarWidget(
            title: 'Профиль',
            widget: SizedBox.shrink(),
          ),
          body: Center(
            child: CircularProgressIndicator(color: Colors.red),
          ),
        );
      }
      if (state is UserLoaded) {
        return Scaffold(
          appBar: AppBarWidget(
            title: ' ${state.user.firstName} ${state.user.lastName} ',
            widget: SizedBox.shrink(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                TitleWidget(
                  title: 'Добро пожаловать ${state.user.firstName}',
                  color: Colors.black,
                ),
                Text(state.user.firstName),
              ],
            ),
          ),
        );
      }
      if (state is UserError) {
        return Scaffold(
          appBar: const AppBarWidget(
            title: 'Профиль',
            widget: SizedBox.shrink(),
          ),
          body: Center(
            child: Text(state.errorMessag),
          ),
        );
      }
      return Container();
    });
  }
}
