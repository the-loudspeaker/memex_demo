import 'package:flutter/material.dart';
import 'package:memex_demo/components/name_price_widget.dart';
import 'package:memex_demo/components/graph_component.dart';
import 'package:memex_demo/components/primary_tab_view.dart';
import 'package:memex_demo/components/stats_component.dart';
import 'package:memex_demo/model/memex_response.dart';
import 'package:memex_demo/network/order_service.dart';
import 'package:memex_demo/pages/trade_screen.dart';
import 'package:memex_demo/utils/custom_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MemexResponse? memexResponse;
  bool isLoading = true;
  @override
  void initState() {
    fetchMemexData();
    super.initState();
  }

  Future<void> fetchMemexData() async {
    var apiResponse = await OrderService().getDogeResponse();
    apiResponse.onSuccess((successResponse) {
      setState(() {
        memexResponse = successResponse;
        isLoading = false;
      });
    });
    apiResponse.onFailure((failure) {
      setState(() {
        memexResponse = null;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("MEMEX")),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : memexResponse == null
                ? const Text("Error fetching data")
                : ListView(
                    primary: true,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(24),
                    children: [
                        NameAndPriceWidget(
                          memexResponse: memexResponse!,
                        ),
                        const Divider(thickness: 1, color: Colors.grey),
                        SizedBox(
                            height: 120,
                            child: StatsComponent(
                              statsList: memexResponse?.stats ?? [],
                            )),
                        const Divider(thickness: 1, color: Colors.grey),
                        AspectRatio(
                            aspectRatio: 16 / 9, child: GraphComponent()),
                        const Divider(thickness: 1, color: Colors.grey),
                        PrimaryTabView(
                          positionsList: memexResponse?.positions ?? [],
                          name: memexResponse!.name.toString(),
                        )
                      ]),
        floatingActionButton: Container(
          padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
          height: 48,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              style: ButtonStyle(
                  maximumSize:
                      WidgetStatePropertyAll(MediaQuery.of(context).size),
                  backgroundColor: WidgetStateProperty.resolveWith((states) {
                    return Theme.of(context).colorScheme.secondaryContainer;
                  })),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TradeScreen();
                  })),
              child: Text("Trade", style: MontserratFont.heading4)),
        ),
      ),
    );
  }
}
