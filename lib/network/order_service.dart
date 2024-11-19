import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:memex_demo/model/memex_response.dart';
import 'package:result_dart/result_dart.dart';

class OrderService {
  Future<Result<MemexResponse, String>> getDogeResponse() async {
    // var responseData = {
    //   "name": "DOGE-USD",
    //   "price": {
    //     "amount": 0.374,
    //     "currency": "USD"
    //   },
    //   "change": 4.5,
    //   "changePositive": true,
    //   "stats": [
    //     {
    //       "name": "24 Hr. Volume",
    //       "value": {
    //         "amount": 7436.5,
    //         "currency": "USD"
    //       }
    //     },
    //     {
    //       "name": "Open Interest",
    //       "value": {
    //         "amount": 1383.87,
    //         "currency": "USD"
    //       }
    //     }
    //   ],
    //   "graphData": [],
    //   "positions": [
    //     {
    //       "type": "LONG",
    //       "quantity": 7000,
    //       "change": "+USD 400"
    //     },
    //     {
    //       "type": "SHORT",
    //       "quantity": 450,
    //       "change": "-USD 120"
    //     },
    //     {
    //       "type": "LONG",
    //       "quantity": 100,
    //       "change": "+USD 40"
    //     }
    //   ]
    // };
    try {
      var responseData = await http.get(Uri.parse("https://mocki.io/v1/4f932135-a16a-44b0-90c4-9ff2212ee16d"));
      return Success(MemexResponse.fromJson(jsonDecode(responseData.body)));
    } on Exception catch (e) {
      debugPrint(e.toString());
      return const Failure("Failed getting loading memex.");
    }
  }
}