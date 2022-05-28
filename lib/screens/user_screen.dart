import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user/user_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UserScreen')),
      body: const UserScreenWidget(),
    );
  }
}

class UserScreenWidget extends StatelessWidget {
  const UserScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        }
        if (state is UserLoaded) {
          return Column(
            children: [Text(state.user.firstName)],
          );
        }
        if (state is UserError) {
          return Center(
            child: Text(state.errorMessag),
          );
        }
        return Container();
      },
    );
  }
}
