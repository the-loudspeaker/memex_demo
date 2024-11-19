import 'package:flutter/material.dart';
import 'package:memex_demo/utils/custom_fonts.dart';
import 'package:memex_demo/utils/utils.dart';

class SuccessScreen extends StatelessWidget {
  final String orderType;
  final String price;
  final String quantity;
  final String name;
  const SuccessScreen(
      {super.key,
      required this.orderType,
      required this.price,
      required this.quantity,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Order Placed!", context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              Image.asset("assets/success.png", height: 300),
              Row(
                children: [
                  Image.asset("assets/doge.png", height: 48),
                  const SizedBox(width: 8),
                  Text(
                    "Open Position",
                    style: MontserratFont.paragraphBold1,
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Order Type"), Text(orderType)],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Price"), Text(price)],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Quantity"), Text("$quantity $name")],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(name)),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                        onPressed: null, child: Text("My Wallet")),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
