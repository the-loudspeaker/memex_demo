import 'package:flutter/material.dart';
import 'package:memex_demo/model/memex_response.dart';
import 'package:memex_demo/utils/custom_fonts.dart';

class NameAndPriceWidget extends StatelessWidget {
  final MemexResponse memexResponse;
  const NameAndPriceWidget({super.key, required this.memexResponse});

  @override
  Widget build(BuildContext context) {
    String signToAdd = memexResponse.changePositive ? "+" : "-";
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/doge.png", width: 28),
                const SizedBox(width: 6),
                Text(
                  memexResponse.name.toString(),
                  style: MontserratFont.heading3.copyWith(color: Colors.white),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                )
              ],
            )),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "${memexResponse.price!.currency!} ${memexResponse.price!.amount}",
                style:
                    MontserratFont.heading2.copyWith(color: Colors.redAccent)),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.redAccent, Colors.transparent]),
                  border: Border.all(color: Colors.redAccent, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_downward_outlined, color: Colors.redAccent, size: 24,),
                  Text("$signToAdd${memexResponse.change}%",
                      style: MontserratFont.heading5
                          .copyWith(color: Colors.redAccent)),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
