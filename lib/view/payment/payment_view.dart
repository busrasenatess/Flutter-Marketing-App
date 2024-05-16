import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:marketingapp/core/init/navigation/routes.dart';
import '../../core/components/button/button.dart';
import '../../core/components/scaffold/scaffold.dart';
import '../../core/components/textFormField/text_form_field_widget.dart';
import '../../core/components/textFormField/validate_operations.dart';
import '../../core/constants/app/color_constants.dart';

@RoutePage()
class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String _cardNumber = "";
  String _holderName = "";
  String _expiryDate = "";
  String _cvv = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appbarTitle: "Payment",
        body: Column(
          children: [
            CreditCardWidget(
              cardNumber: _cardNumber,
              expiryDate: _expiryDate,
              cardHolderName: _holderName,
              cvvCode: _cvv,

              showBackView: false,
              onCreditCardWidgetChange: (va) {}, //true when you want to show cvv(back) view
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      onChanged: (value) {
                        setState(() {
                          _cardNumber = value;
                        });
                      },
                      validator: (value) => validateOperation(value, "Bu alan boş bırakılamaz"),
                      maxLength: 16,
                      title: "Card Number",
                    ),
                    TextFormFieldWidget(
                      onChanged: (value) {
                        setState(() {
                          _holderName = value;
                        });
                      },
                      validator: (value) => validateOperation(value, "Bu alan boş bırakılamaz"),
                      title: "Holder Name",
                    ),
                    TextFormFieldWidget(
                      onChanged: (value) {
                        setState(() {
                          _expiryDate = value;
                        });
                      },
                      maxLength: 5,
                      validator: (value) => validateOperation(value, "Bu alan boş bırakılamaz"),
                      textInputType: TextInputType.datetime,
                      title: "Expiry Date",
                    ),
                    TextFormFieldWidget(
                      onChanged: (value) {
                        setState(() {
                          _cvv = value;
                        });
                      },
                      maxLength: 3,
                      validator: (value) => validateOperation(value, "Bu alan boş bırakılamaz"),
                      textInputType: TextInputType.number,
                      title: "CVV",
                    ),
                  ],
                )),
            ButtonWidget(
              onTap: () {
                formKey.currentState?.save();
                if (formKey.currentState!.validate()) {
                  context.router.push(const PaymentResultRoute());
                }
              },
              text: "Devam",
              buttonColor: ColorConstants.instance?.mainColor,
            )
          ],
        ));
  }
}
