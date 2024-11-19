import 'package:flutter/material.dart';
import 'package:memex_demo/model/memex_response.dart';

import 'positions_tab_view.dart';

class PrimaryTabView extends StatelessWidget {
  final List<Position> positionsList;
  final String name;
  const PrimaryTabView({super.key, required this.positionsList, required this.name});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(isScrollable: false, tabs: [
            Container(
              height: 48,
              alignment: Alignment.center,
              child: const Text("Positions"),
            ),
            Container(
              height: 48,
              alignment: Alignment.center,
              child: const Text("Open Orders"),
            ),
            Container(
              height: 48,
              alignment: Alignment.center,
              child: const Text("TP/SL"),
            ),
            Container(
              height: 48,
              alignment: Alignment.center,
              child: const Text("Order History"),
            )
          ]),
          const SizedBox(height: 8),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: TabBarView(children: [
              PositionsTabView(positionsList: positionsList, name: name,),
              const SizedBox(),
              const SizedBox(),
              const SizedBox(),
            ]),
          )
        ],
      ),
    );
  }
}
