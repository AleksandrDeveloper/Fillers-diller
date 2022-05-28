import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import '../blocs/splashScreen/splashscreen_bloc.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashscreenBloc>(context).add(OpenApp(context: context));
    return BlocBuilder<SplashscreenBloc, SplashscreenState>(
      builder: (context, state) {
        if (state is SplashscreenLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SplashscreenLoaded) {
          return SplashScreenView(
            navigateRoute: state.widget,
            duration: 4500,
            imageSize: 130,
            imageSrc:
                'https://fillers-diller.ru/wp-content/uploads/2021/05/1620743215730-2.png',
            backgroundColor: Colors.black,
          );
        }
        return Container();
      },
    );
  }
}
