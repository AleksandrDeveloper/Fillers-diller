import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user/user_bloc.dart';
import '../widgets/widgets.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoading) {
        return Scaffold(
          appBar: AppBarWidget(
            title: 'Профиль',
            widget: const SizedBox.shrink(),
            iconLeft: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xffffffff),
              ),
            ),
          ),
          body: const Center(
            child: CircularProgressIndicator(color: Colors.red),
          ),
          bottomNavigationBar: BottomBarWidget(),
        );
      }
      if (state is UserLoaded) {
        return Scaffold(
          appBar: AppBarWidget(
            title: 'Профиль',
            widget: const SizedBox.shrink(),
            iconLeft: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xffffffff),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                TitleWidget(
                  title: 'Добро пожаловать ${state.user.firstName}',
                  color: Colors.black,
                ),
                Text(state.user.username),
              ],
            ),
          ),
          bottomNavigationBar: BottomBarWidget(),
        );
      }
      if (state is UserError) {
        return Scaffold(
          appBar: AppBarWidget(
            title: 'Профиль',
            widget: const SizedBox.shrink(),
            iconLeft: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xffffffff),
              ),
            ),
          ),
          body: Center(
            child: Text(state.errorMessag),
          ),
          bottomNavigationBar: BottomBarWidget(),
        );
      }
      return Container();
    });
  }
}
