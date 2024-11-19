import 'package:flutter/material.dart';
import 'package:memex_demo/model/memex_response.dart';

class PositionsTabView extends StatelessWidget {
  final String name;
  final List<Position> positionsList;
  const PositionsTabView(
      {super.key, required this.positionsList, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return PositionWidget(position: positionsList[index], name: name);
        },
        separatorBuilder: (context, index) =>
            const Divider(thickness: 1, color: Colors.grey),
        itemCount: positionsList.length);
  }
}

class PositionWidget extends StatelessWidget {
  final Position position;
  final String name;
  const PositionWidget({super.key, required this.position, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(name), Text(position.quantity.toString())],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(position.type.toString()),
            Text(position.change.toString())
          ],
        )
      ],
    );
  }
}
