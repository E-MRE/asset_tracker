import 'package:asset_tracker/models/asset_model.dart';
import 'package:asset_tracker/models/harem_assets_model.dart';
import 'package:asset_tracker/models/meta_model.dart';

class HaremResponseModel {
  const HaremResponseModel({required this.meta, required this.data});

  const HaremResponseModel.empty() : this(meta: const MetaModel.empty(), data: const HaremAssetsModel.empty());

  final MetaModel meta;
  final HaremAssetsModel data;

  bool get isEmpty => meta.dateTime.isEmpty;

  List<AssetModel> get assets => [
        data.gold,
        data.gold22k,
        data.gold14k,
        data.barGold,
        data.newQuarterGoldCoin,
        data.oldQuarterGoldCoin,
        data.newHalfGoldCoin,
        data.oldHalfGoldCoin,
        data.newFullGoldCoin,
        data.oldFullGoldCoin,
        data.newAtaGold,
        data.oldAtaGold,
        data.newAtaFiveGold,
        data.oldAtaFiveGold,
        data.newGremeseGold,
        data.oldGremeseGold,
        data.platinum,
        data.eurTry,
        data.silverUsd,
        data.xagUsd,
        data.silverTry,
        data.xauXag,
        data.usdPure,
        data.ons,
        data.eurUsd,
      ];

  factory HaremResponseModel.fromJson(Map<String, dynamic> json) {
    return HaremResponseModel(
      data: HaremAssetsModel.fromJson(json.containsKey('data') ? json['data'] : const HaremAssetsModel.empty()),
      meta: MetaModel.fromJson(json.containsKey('meta') ? json['meta'] : const MetaModel.empty()),
    );
  }

  HaremResponseModel copyWith({MetaModel? meta, HaremAssetsModel? data}) {
    return HaremResponseModel(meta: meta ?? this.meta, data: data ?? this.data);
  }
}
