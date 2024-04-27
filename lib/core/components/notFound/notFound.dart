import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class NotFoundProductWidget extends StatelessWidget {
  const NotFoundProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/lottie/not-found-lottie.json"),
    );
  }
}
