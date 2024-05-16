import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:marketingapp/core/init/navigation/routes.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/bloc/product_bloc.dart';
import '../../core/components/button/button.dart';
import '../../core/components/scaffold/scaffold.dart';
import '../../core/constants/app/color_constants.dart';
import '../../core/extensions/num_extensions.dart';

enum PaymentResultState { loading, success }

@RoutePage()
class PaymentResultView extends StatefulWidget {
  const PaymentResultView({super.key});

  @override
  State<PaymentResultView> createState() => _PaymentResultViewState();
}

class _PaymentResultViewState extends State<PaymentResultView> {
  PaymentResultState _paymentResultState = PaymentResultState.loading;
  late ProductBloc _productBloc;
  @override
  void initState() {
    _productBloc = context.read<ProductBloc>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _paymentResultState = PaymentResultState.success;
      });
    });
    super.initState();
  }

  String checkPaymentStatus() {
    return _paymentResultState == PaymentResultState.loading ? "loading" : "success";
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appbarTitle: "Payment Result",
        body: Column(
          children: [
            Lottie.asset("assets/lottie/payment-${checkPaymentStatus()}-lottie.json"),
            25.h.ph,
            _paymentResultState == PaymentResultState.success
                ? ButtonWidget(
                    onTap: () {
                      _productBloc.add(ClearBasket());
                      context.router.replaceAll([
                        const MainRoute(children: [HomeRoute()])
                      ]);
                    },
                    text: "Finish",
                    buttonColor: ColorConstants.instance?.mainColor,
                  )
                : 0.ph
          ],
        ));
  }
}
