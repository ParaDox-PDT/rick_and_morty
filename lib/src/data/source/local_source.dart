import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rick_and_morty/src/core/constants/constants.dart';
import 'package:rick_and_morty/src/core/utils/utils.dart';


final class LocalSource {
  const LocalSource(this.box);

  final Box<dynamic> box;

  /// OTHER ----------------------------------------------

  String get locale => box.get(
        AppKeys.languageCode,
        defaultValue: defaultLocale,
      ) as String;

  bool get lanSelected =>
      box.get(AppKeys.langSelected, defaultValue: false) is bool
          ? box.get(AppKeys.langSelected, defaultValue: false) as bool
          : false;

  Future<void> setThemeMode(ThemeMode mode) async {
    await box.put(AppKeys.themeMode, mode.name);
  }

  Future<void> setLocale(String lang) async {
    await box.put(AppKeys.languageCode, lang);
  }

  Future<void> setKey(String key, String value) async {
    await box.put(key, value);
  }

  Future<void> setLangSelected({required bool value}) async {
    await box.put(AppKeys.langSelected, value);
  }

  String getKey(String key) => box.get(key, defaultValue: '') as String;

  ThemeMode get themeMode => switch (box.get(AppKeys.themeMode)) {
        'system' => ThemeMode.system,
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.light,
      };

  Future<void> clear() async {
    await box.clear();
  }
}

/// HIVE REGISTER ADAPTERS

// HiveInterface hiveRegister() => Hive
//   ..registerAdapter(AgentsAdapter())
//   ..registerAdapter(AgentsDataAdapter())
//   ..registerAdapter(AgentsRoleAdapter())
//   ..registerAdapter(AgentsAbilitiesAdapter())
//   ..registerAdapter(WeaponsAdsStatsAdapter())
//   ..registerAdapter(WeaponsChromasAdapter())
//   ..registerAdapter(WeaponsDamageRangesAdapter())
//   ..registerAdapter(WeaponsDataAdapter())
//   ..registerAdapter(WeaponsGridPositionAdapter())
//   ..registerAdapter(WeaponsLevelsAdapter())
//   ..registerAdapter(WeaponsResponseAdapter())
//   ..registerAdapter(WeaponsShopDataAdapter())
//   ..registerAdapter(WeaponsSkinsAdapter())
//   ..registerAdapter(WeaponsStatsAdapter())
//   ..registerAdapter(WeaponsDetailResponseAdapter())
//   ..registerAdapter(RanksResponseAdapter())
//   ..registerAdapter(RanksDataAdapter())
//   ..registerAdapter(RanksTiersAdapter())
//   ..registerAdapter(SpraysResponseAdapter())
//   ..registerAdapter(SpraysDataAdapter())
//   ..registerAdapter(SpraysLevelsAdapter())
//   ..registerAdapter(PlayerCardsResponseAdapter())
//   ..registerAdapter(PlayerCardsDataAdapter())
//   ..registerAdapter(MapsResponseAdapter())
//   ..registerAdapter(MapsDataAdapter())
//   ..registerAdapter(MapsCalloutsAdapter())
//   ..registerAdapter(MapsLocationAdapter())
//   ..registerAdapter(MapDetailResponseAdapter());
