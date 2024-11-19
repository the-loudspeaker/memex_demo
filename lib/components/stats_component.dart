import 'package:flutter/material.dart';
import 'package:memex_demo/model/memex_response.dart';
import 'package:memex_demo/utils/custom_fonts.dart';

class StatsComponent extends StatelessWidget {
  final List<Stat> statsList;
  const StatsComponent({super.key, required this.statsList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return SizedBox(
              width: MediaQuery.of(context).size.width / statsList.length -
                  ((statsList.length - 1) * 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(statsList[index].name.toString(),
                      style: MontserratFont.paragraphMedium1),
                  Text(
                      "${statsList[index].value?.currency} ${statsList[index].value!.amount}",
                      style: MontserratFont.paragraphMedium1),
                ],
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            color: Colors.grey,
            width: 2,
          );
        },
        itemCount: statsList.length);
  }
}
