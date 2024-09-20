import 'package:asset_tracker/utils/enums/asset_type.dart';

class AssetModel {
  const AssetModel({
    required this.code,
    required this.buyingPrice,
    required this.sellingPrice,
    required this.dateTime,
    required this.lowPrice,
    required this.highPrice,
    required this.closingPrice,
  });

  const AssetModel.empty()
      : this(
          code: '',
          dateTime: '',
          lowPrice: 0,
          highPrice: 0,
          buyingPrice: 0,
          sellingPrice: 0,
          closingPrice: 0,
        );

  final String code;
  final double buyingPrice;
  final double sellingPrice;
  final String dateTime;
  final double lowPrice;
  final double highPrice;
  final double closingPrice;

  AssetType get type => code.toAssetType();
  bool get isNotEmpty => code.isNotEmpty;

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      code: json.containsKey('code') ? json['code'] as String? ?? '' : '',
      buyingPrice: json.containsKey('alis') ? (double.tryParse(json['alis'].toString()) ?? 0) : 0,
      sellingPrice: json.containsKey('satis') ? (double.tryParse(json['satis'].toString()) ?? 0) : 0,
      lowPrice: json.containsKey('dusuk') ? (double.tryParse(json['dusul'].toString()) ?? 0) : 0,
      highPrice: json.containsKey('yuksek') ? (double.tryParse(json['yuksek'].toString()) ?? 0) : 0,
      closingPrice: json.containsKey('kapanis') ? (double.tryParse(json['kapanis'].toString()) ?? 0) : 0,
      dateTime: json.containsKey('tarih') ? json['tarih'] as String? ?? '' : '',
    );
  }
}
