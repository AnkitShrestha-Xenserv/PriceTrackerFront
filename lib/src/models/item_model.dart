class ItemModel {
  final String productName;
  final String productId;
  final String previousDate;
  final String previousPrice;
  final String currentPrice;
  final String currentDate;
  final String thresholdPrice;
  final String rating;
  final String url;

  ItemModel()
      : productName = "",
        productId = '0',
        previousDate = '0',
        previousPrice = '0',
        currentPrice = '0',
        currentDate = '0',
        thresholdPrice = '0',
        rating = '',
        url = '';

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : productName = parsedJson["productName"],
        productId = parsedJson["productId"],
        previousDate = parsedJson["previousDate"],
        previousPrice = parsedJson["previousPrice"] ?? '0',
        currentPrice = parsedJson["currentPrice"],
        currentDate = parsedJson["currentDate"],
        thresholdPrice = parsedJson["thresholdPrice"] ?? '0',
        rating = parsedJson["rating"] ?? '0',
        url = parsedJson["url"] ?? "";
}
