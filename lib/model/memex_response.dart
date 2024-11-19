class MemexResponse {
  String? name;
  Price? price;
  num? change;
  bool changePositive = false;
  List<Stat>? stats;
  List<String>? graphData;
  List<Position>? positions;

  MemexResponse(
      {this.name,
        this.price,
        this.change,
        changePositive,
        this.stats,
        this.graphData,
        this.positions});

  MemexResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    change = json['change'];
    changePositive = json['changePositive']?? false;
    if (json['stats'] != null) {
      stats = <Stat>[];
      json['stats'].forEach((v) {
        stats!.add(Stat.fromJson(v));
      });
    }
    if (json['graphData'] != null) {
      graphData = <String>[];
    }
    if (json['positions'] != null) {
      positions = <Position>[];
      json['positions'].forEach((v) {
        positions!.add(Position.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['change'] = change;
    data['changePositive'] = changePositive;
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (graphData != null) {
      data['graphData'] = List.empty();
    }
    if (positions != null) {
      data['positions'] = positions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Price {
  num? amount;
  String? currency;

  Price({this.amount, this.currency});

  Price.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }
}

class Stat {
  String? name;
  Price? value;

  Stat({this.name, this.value});

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'] != null ? Price.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (value != null) {
      data['value'] = value!.toJson();
    }
    return data;
  }
}

class Position {
  String? type;
  int? quantity;
  String? change;

  Position({this.type, this.quantity, this.change});

  Position.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    quantity = json['quantity'];
    change = json['change'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['quantity'] = quantity;
    data['change'] = change;
    return data;
  }
}
