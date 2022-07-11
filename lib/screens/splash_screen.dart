import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:testfff/config/api_client.dart';
import '../blocs/all_category/all_category_bloc.dart';
import '../blocs/all_product/all_product_bloc.dart';
import '../blocs/splashScreen/splashscreen_bloc.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  void initState() {
    BlocProvider.of<AllProductBloc>(context).add(GetAllProduct());
    BlocProvider.of<AllCategoryBloc>(context).add(GetAllCategory());
    BlocProvider.of<SplashscreenBloc>(context).add(OpenApp(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            imageSrc: state.imageUrl,
            backgroundColor: Colors.black,
          );
        }
        return Container();
      },
    );
  }
}
