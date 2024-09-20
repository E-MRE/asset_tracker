enum AssetType {
  gold('ALTIN', 'Saf Altın (999)'),
  gold22k('AYAR22', '22 Ayar Altın'),
  gold14k('AYAR14', '14 Ayar Altın'),
  barGold('KULCEALTIN', 'Gram Altın (995)'),
  newAtaGold('ATA_YENI', 'Ata Lira (Yeni)'),
  newAtaFiveGold('ATA5_YENI', '5\'li Ata Lira (Yeni)'),
  newFullGoldCoin('TEK_YENI', 'Tam Altın (Yeni)'),
  newGremeseGold('GREMESE_YENI', 'Gremese Altın (Yeni)'),
  newHalfGoldCoin('YARIM_YENI', 'Yarım Altın (Yeni)'),
  newQuarterGoldCoin('CEYREK_YENI', 'Çeyrek Altın (Yeni)'),
  oldAtaFiveGold('ATA5_ESKI', '5\'li Ata Lira (Eski)'),
  oldAtaGold('ATA_ESKI', 'Ata Lira (Eski)'),
  oldFullGoldCoin('TEK_ESKI', 'Tam Altın (Eski)'),
  oldGremeseGold('GREMESE_ESKI', 'Gremese Altın (Eski)'),
  oldHalfGoldCoin('YARIM_ESKI', 'Yarım Altın (Eski)'),
  oldQuarterGoldCoin('CEYREK_ESKI', 'Çeyrek Altın (Eski)'),
  platinum('PLATIN', 'Platin'),
  eurTry('EURTRY', 'Euro / Türk Lirası'),
  silverUsd('GUMUSUSD', 'Gümüş / Dolar'),
  xagUsd('XAGUSD', 'Gümüş / Dolar'),
  silverTry('GUMUSTRY', 'Gümüş / Türk Lirası'),
  xauXag('XAUXAG', 'Altın / Gümüş'),
  usdPure('USDPURE', 'Dolar / Saf Altın'),
  ons('ONS', 'Ons Altın'),
  eurUsd('EURUSD', 'Euro / Dolar'),
  others('NONE', 'Tanımsız');

  final String code;
  final String name;
  const AssetType(this.code, this.name);
}

extension AssetTypeExtension on String {
  AssetType toAssetType() {
    final index = AssetType.values.indexWhere((element) => element.code.toLowerCase() == toLowerCase());
    if (index == -1) {
      return AssetType.others;
    }

    return AssetType.values[index];
  }
}
