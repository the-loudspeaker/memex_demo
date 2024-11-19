import 'package:flutter/material.dart';
import 'package:memex_demo/utils/custom_fonts.dart';
import 'package:memex_demo/utils/utils.dart';

import 'success_screen.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen>
    with SingleTickerProviderStateMixin {
  String trxType = "Market";
  String leverage = "10x";
  late TabController _tabController;
  final TextEditingController _textEditingController = TextEditingController();
  String holdType = "Long";
  double _sliderValue = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String primaryText = holdType == "Long" ? "BUY / LONG" : "SELL / SHORT";
    String orderType = holdType == "Long" ? "LONG-BUY" : "SHORT-SELL";
    return Scaffold(
      appBar: customAppBar("Trade", context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: DropdownButton(
                            isExpanded: true,
                            itemHeight: 48,
                            value: trxType,
                            style: MontserratFont.paragraphMedium1
                                .copyWith(color: Colors.white),
                            items: const [
                              DropdownMenuItem(
                                alignment: Alignment.center,
                                value: "Market",
                                child: Text("Market"),
                              ),
                              DropdownMenuItem(
                                alignment: Alignment.center,
                                value: "Limit",
                                child: Text("Limit"),
                              ),
                              DropdownMenuItem(
                                alignment: Alignment.center,
                                value: "Stop Limit",
                                child: Text("Stop Limit"),
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                trxType = value!;
                              });
                            }),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton(
                          itemHeight: 48,
                          style: MontserratFont.paragraphMedium1
                              .copyWith(color: Colors.white),
                          value: leverage,
                          items: const [
                            DropdownMenuItem(
                              alignment: Alignment.center,
                              value: "1x",
                              child: Text("1x"),
                            ),
                            DropdownMenuItem(
                              alignment: Alignment.center,
                              value: "10x",
                              child: Text("10x"),
                            ),
                            DropdownMenuItem(
                              alignment: Alignment.center,
                              value: "100x",
                              child: Text("100x"),
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              leverage = value!;
                            });
                          }),
                    )
                  ],
                ),
                TabBar(
                    indicatorColor: Colors.transparent,
                    onTap: (value) {
                      setState(() {
                        _tabController.animateTo(value);
                        holdType = value == 1 ? "Short" : "Long";
                      });
                    },
                    padding: const EdgeInsets.all(8),
                    controller: _tabController,
                    isScrollable: false,
                    tabs: [
                      Container(
                        decoration: _tabController.index == 0
                            ? BoxDecoration(
                                gradient: RadialGradient(
                                  radius: 3,
                                  focal: Alignment.center,
                                  colors: [
                                    Colors.transparent,
                                    Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer
                                  ], // Adjust colors to match
                                  center: Alignment.center,
                                ),
                                border: Border.all(
                                    width: 1,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer),
                                borderRadius: BorderRadius.circular(4),
                              )
                            : null,
                        height: 48,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Long",
                                style: MontserratFont.paragraphMedium1.copyWith(
                                    color: _tabController.index == 0
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer
                                        : Colors.grey)),
                            Icon(Icons.keyboard_double_arrow_up_outlined,
                                color: _tabController.index == 0
                                    ? Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer
                                    : Colors.grey)
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        decoration: _tabController.index == 1
                            ? BoxDecoration(
                                gradient: RadialGradient(
                                  radius: 3,
                                  focal: Alignment.center,
                                  colors: [
                                    Colors.transparent,
                                    Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer
                                  ], // Adjust colors to match
                                  center: Alignment.center,
                                ),
                                border: Border.all(
                                    width: 1,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer),
                                borderRadius: BorderRadius.circular(4),
                              )
                            : null,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Short",
                                style: MontserratFont.paragraphMedium1.copyWith(
                                    color: _tabController.index == 1
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer
                                        : Colors.grey)),
                            Icon(Icons.keyboard_double_arrow_down_outlined,
                                color: _tabController.index == 1
                                    ? Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer
                                    : Colors.grey)
                          ],
                        ),
                      )
                    ]),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Available to trade:"), Text("99 USDC")],
                ),
                const Text("Size (USDC)"),
                TextField(
                  strutStyle: StrutStyle.disabled,
                  onChanged: (value) {
                    setState(() {
                      _textEditingController.text = value;
                      if (isNullOREmpty(value)) {
                        _sliderValue = 0;
                      } else {
                        if (int.parse(value) != 0) {
                          _sliderValue = 100;
                        }
                      }
                    });
                  },
                  controller: _textEditingController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Size"),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.teal,
                          inactiveTrackColor: Colors.teal.withOpacity(0.3),
                          thumbColor: Colors.tealAccent,
                          overlayColor: Colors.teal.withOpacity(0.2),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 10),
                          trackHeight: 4,
                        ),
                        child: Slider(
                          divisions: 4,
                          value: _sliderValue,
                          min: 0,
                          max: 100,
                          onChanged: (value) {
                            setState(() {
                              _sliderValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Text(
                      "${_sliderValue.toInt()}%",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Max:"), Text("199 USDC")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Est. Liq. price:"),
                    Text(isNullOREmpty(_textEditingController.text) ||
                            int.parse(_textEditingController.text) == 0
                        ? "-"
                        : "${(0.35 * int.parse(_textEditingController.text)).toStringAsPrecision(2)} USDC")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text("Account Leverage:"), Text(leverage)],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Account value"), Text("0 USDC")],
                )
              ],
            ),
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            maximumSize: WidgetStatePropertyAll(
                                MediaQuery.of(context).size),
                            backgroundColor:
                                WidgetStateProperty.resolveWith((states) {
                              if (states.contains(WidgetState.disabled)) {
                                return Colors.grey;
                              }
                              return Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer;
                            })),
                        onPressed: isNullOREmpty(_textEditingController.text) ||
                                int.parse(_textEditingController.text) == 0
                            ? null
                            : () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccessScreen(
                                          orderType: orderType,
                                          price:
                                              "${(0.35 * int.parse(_textEditingController.text)).toStringAsPrecision(2)} USDC",
                                          quantity: _textEditingController.text,
                                          name: 'DOGE-USD',
                                        ))),
                        child: Text(primaryText,
                            style: MontserratFont.paragraphBold1
                                .copyWith(color: Colors.black))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
