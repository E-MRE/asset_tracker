import 'package:asset_tracker/models/asset_model.dart';

class HaremAssetsModel {
  const HaremAssetsModel({
    required this.gold,
    required this.gold22k,
    required this.gold14k,
    required this.barGold,
    required this.newQuarterGoldCoin,
    required this.oldQuarterGoldCoin,
    required this.newHalfGoldCoin,
    required this.oldHalfGoldCoin,
    required this.newFullGoldCoin,
    required this.oldFullGoldCoin,
    required this.newAtaGold,
    required this.oldAtaGold,
    required this.newAtaFiveGold,
    required this.oldAtaFiveGold,
    required this.newGremeseGold,
    required this.oldGremeseGold,
    required this.platinum,
    required this.eurTry,
    required this.silverUsd,
    required this.xagUsd,
    required this.silverTry,
    required this.xauXag,
    required this.usdPure,
    required this.ons,
    required this.eurUsd,
  });

  const HaremAssetsModel.empty()
      : this(
          gold: const AssetModel.empty(),
          gold22k: const AssetModel.empty(),
          gold14k: const AssetModel.empty(),
          barGold: const AssetModel.empty(),
          newAtaFiveGold: const AssetModel.empty(),
          newAtaGold: const AssetModel.empty(),
          newFullGoldCoin: const AssetModel.empty(),
          newGremeseGold: const AssetModel.empty(),
          newHalfGoldCoin: const AssetModel.empty(),
          newQuarterGoldCoin: const AssetModel.empty(),
          oldAtaFiveGold: const AssetModel.empty(),
          oldAtaGold: const AssetModel.empty(),
          oldFullGoldCoin: const AssetModel.empty(),
          oldGremeseGold: const AssetModel.empty(),
          oldHalfGoldCoin: const AssetModel.empty(),
          oldQuarterGoldCoin: const AssetModel.empty(),
          platinum: const AssetModel.empty(),
          eurTry: const AssetModel.empty(),
          silverUsd: const AssetModel.empty(),
          xagUsd: const AssetModel.empty(),
          silverTry: const AssetModel.empty(),
          xauXag: const AssetModel.empty(),
          usdPure: const AssetModel.empty(),
          ons: const AssetModel.empty(),
          eurUsd: const AssetModel.empty(),
        );

  final AssetModel gold;
  final AssetModel gold22k;
  final AssetModel gold14k;
  final AssetModel barGold;
  final AssetModel newQuarterGoldCoin;
  final AssetModel oldQuarterGoldCoin;
  final AssetModel newHalfGoldCoin;
  final AssetModel oldHalfGoldCoin;
  final AssetModel newFullGoldCoin;
  final AssetModel oldFullGoldCoin;
  final AssetModel newAtaGold;
  final AssetModel oldAtaGold;
  final AssetModel newAtaFiveGold;
  final AssetModel oldAtaFiveGold;
  final AssetModel newGremeseGold;
  final AssetModel oldGremeseGold;
  final AssetModel platinum;
  final AssetModel eurTry;
  final AssetModel silverUsd;
  final AssetModel xagUsd;
  final AssetModel silverTry;
  final AssetModel xauXag;
  final AssetModel usdPure;
  final AssetModel ons;
  final AssetModel eurUsd;

  factory HaremAssetsModel.fromJson(Map<String, dynamic> json) {
    return HaremAssetsModel(
      gold: json.containsKey('ALTIN') ? AssetModel.fromJson(json['ALTIN']) : const AssetModel.empty(),
      gold22k: json.containsKey('AYAR22') ? AssetModel.fromJson(json['AYAR22']) : const AssetModel.empty(),
      gold14k: json.containsKey('AYAR14') ? AssetModel.fromJson(json['AYAR14']) : const AssetModel.empty(),
      barGold: json.containsKey('KULCEALTIN') ? AssetModel.fromJson(json['KULCEALTIN']) : const AssetModel.empty(),
      newAtaFiveGold: json.containsKey('ATA5_YENI') ? AssetModel.fromJson(json['ATA5_YENI']) : const AssetModel.empty(),
      newAtaGold: json.containsKey('ATA_YENI') ? AssetModel.fromJson(json['ATA_YENI']) : const AssetModel.empty(),
      newFullGoldCoin: json.containsKey('TEK_YENI') ? AssetModel.fromJson(json['TEK_YENI']) : const AssetModel.empty(),
      newGremeseGold:
          json.containsKey('GREMESE_YENI') ? AssetModel.fromJson(json['GREMESE_YENI']) : const AssetModel.empty(),
      newHalfGoldCoin:
          json.containsKey('YARIM_YENI') ? AssetModel.fromJson(json['YARIM_YENI']) : const AssetModel.empty(),
      newQuarterGoldCoin:
          json.containsKey('CEYREK_YENI') ? AssetModel.fromJson(json['CEYREK_YENI']) : const AssetModel.empty(),
      oldAtaFiveGold: json.containsKey('ATA5_ESKI') ? AssetModel.fromJson(json['ATA5_ESKI']) : const AssetModel.empty(),
      oldAtaGold: json.containsKey('ATA_ESKI') ? AssetModel.fromJson(json['ATA_ESKI']) : const AssetModel.empty(),
      oldFullGoldCoin: json.containsKey('TEK_ESKI') ? AssetModel.fromJson(json['TEK_ESKI']) : const AssetModel.empty(),
      oldGremeseGold:
          json.containsKey('GREMESE_ESKI') ? AssetModel.fromJson(json['GREMESE_ESKI']) : const AssetModel.empty(),
      oldHalfGoldCoin:
          json.containsKey('YARIM_ESKI') ? AssetModel.fromJson(json['YARIM_ESKI']) : const AssetModel.empty(),
      oldQuarterGoldCoin:
          json.containsKey('CEYREK_ESKI') ? AssetModel.fromJson(json['CEYREK_ESKI']) : const AssetModel.empty(),
      platinum: json.containsKey('PLATIN') ? AssetModel.fromJson(json['PLATIN']) : const AssetModel.empty(),
      eurTry: json.containsKey('EURTRY') ? AssetModel.fromJson(json['EURTRY']) : const AssetModel.empty(),
      silverUsd: json.containsKey('GUMUSUSD') ? AssetModel.fromJson(json['GUMUSUSD']) : const AssetModel.empty(),
      xagUsd: json.containsKey('XAGUSD') ? AssetModel.fromJson(json['XAGUSD']) : const AssetModel.empty(),
      eurUsd: json.containsKey('EURUSD') ? AssetModel.fromJson(json['EURUSD']) : const AssetModel.empty(),
      ons: json.containsKey('ONS') ? AssetModel.fromJson(json['ONS']) : const AssetModel.empty(),
      silverTry: json.containsKey('GUMUSTRY') ? AssetModel.fromJson(json['GUMUSTRY']) : const AssetModel.empty(),
      usdPure: json.containsKey('USDPURE') ? AssetModel.fromJson(json['USDPURE']) : const AssetModel.empty(),
      xauXag: json.containsKey('XAUXAG') ? AssetModel.fromJson(json['XAUXAG']) : const AssetModel.empty(),
    );
  }

  HaremAssetsModel copyWith({
    required AssetModel gold,
    required AssetModel gold22k,
    required AssetModel gold14k,
    required AssetModel barGold,
    required AssetModel newQuarterGoldCoin,
    required AssetModel oldQuarterGoldCoin,
    required AssetModel newHalfGoldCoin,
    required AssetModel oldHalfGoldCoin,
    required AssetModel newFullGoldCoin,
    required AssetModel oldFullGoldCoin,
    required AssetModel newAtaGold,
    required AssetModel oldAtaGold,
    required AssetModel newAtaFiveGold,
    required AssetModel oldAtaFiveGold,
    required AssetModel newGremeseGold,
    required AssetModel oldGremeseGold,
    required AssetModel platinum,
    required AssetModel eurTry,
    required AssetModel silverUsd,
    required AssetModel xagUsd,
    required AssetModel silverTry,
    required AssetModel xauXag,
    required AssetModel usdPure,
    required AssetModel ons,
    required AssetModel eurUsd,
  }) {
    return HaremAssetsModel(
      gold: gold.isNotEmpty ? gold : this.gold,
      gold22k: gold22k.isNotEmpty ? gold22k : this.gold22k,
      gold14k: gold14k.isNotEmpty ? gold14k : this.gold14k,
      barGold: barGold.isNotEmpty ? barGold : this.barGold,
      newQuarterGoldCoin: newQuarterGoldCoin.isNotEmpty ? newQuarterGoldCoin : this.newQuarterGoldCoin,
      oldQuarterGoldCoin: oldQuarterGoldCoin.isNotEmpty ? oldQuarterGoldCoin : this.oldQuarterGoldCoin,
      newHalfGoldCoin: newHalfGoldCoin.isNotEmpty ? newHalfGoldCoin : this.newHalfGoldCoin,
      oldHalfGoldCoin: oldHalfGoldCoin.isNotEmpty ? oldHalfGoldCoin : this.oldHalfGoldCoin,
      newFullGoldCoin: newFullGoldCoin.isNotEmpty ? newFullGoldCoin : this.newFullGoldCoin,
      oldFullGoldCoin: oldFullGoldCoin.isNotEmpty ? oldFullGoldCoin : this.oldFullGoldCoin,
      newAtaGold: newAtaGold.isNotEmpty ? newAtaGold : this.newAtaGold,
      oldAtaGold: oldAtaGold.isNotEmpty ? oldAtaGold : this.oldAtaGold,
      newAtaFiveGold: newAtaFiveGold.isNotEmpty ? newAtaFiveGold : this.newAtaFiveGold,
      oldAtaFiveGold: oldAtaFiveGold.isNotEmpty ? oldAtaFiveGold : this.oldAtaFiveGold,
      newGremeseGold: newGremeseGold.isNotEmpty ? newGremeseGold : this.newGremeseGold,
      oldGremeseGold: oldGremeseGold.isNotEmpty ? oldGremeseGold : this.oldGremeseGold,
      platinum: platinum.isNotEmpty ? platinum : this.platinum,
      eurTry: eurTry.isNotEmpty ? eurTry : this.eurTry,
      silverUsd: silverUsd.isNotEmpty ? silverUsd : this.silverUsd,
      xagUsd: xagUsd.isNotEmpty ? xagUsd : this.xagUsd,
      silverTry: silverTry.isNotEmpty ? silverTry : this.silverTry,
      xauXag: xauXag.isNotEmpty ? xauXag : this.xauXag,
      usdPure: usdPure.isNotEmpty ? usdPure : this.usdPure,
      ons: ons.isNotEmpty ? ons : this.ons,
      eurUsd: eurUsd.isNotEmpty ? eurUsd : this.eurUsd,
    );
  }

  HaremAssetsModel copyFromAnother(HaremAssetsModel another) {
    return copyWith(
      gold: another.gold,
      gold22k: another.gold22k,
      gold14k: another.gold14k,
      barGold: another.barGold,
      newQuarterGoldCoin: another.newQuarterGoldCoin,
      oldQuarterGoldCoin: another.oldQuarterGoldCoin,
      newHalfGoldCoin: another.newHalfGoldCoin,
      oldHalfGoldCoin: another.oldHalfGoldCoin,
      newFullGoldCoin: another.newFullGoldCoin,
      oldFullGoldCoin: another.oldFullGoldCoin,
      newAtaGold: another.newAtaGold,
      oldAtaGold: another.oldAtaGold,
      newAtaFiveGold: another.newAtaFiveGold,
      oldAtaFiveGold: another.oldAtaFiveGold,
      newGremeseGold: another.newGremeseGold,
      oldGremeseGold: another.oldGremeseGold,
      platinum: another.platinum,
      eurTry: another.eurTry,
      silverUsd: another.silverUsd,
      xagUsd: another.xagUsd,
      silverTry: another.silverTry,
      xauXag: another.xauXag,
      usdPure: another.usdPure,
      ons: another.ons,
      eurUsd: another.eurUsd,
    );
  }
}
