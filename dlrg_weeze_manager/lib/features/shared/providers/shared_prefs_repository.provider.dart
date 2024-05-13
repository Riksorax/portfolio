import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repositories/shared_prefs_repositories.dart';

part 'shared_prefs_repository.provider.g.dart';

@riverpod
Future<bool> saveThemeModeSharedPrefs(
        SaveThemeModeSharedPrefsRef ref, String themeMode, ThemeMode mode) =>
    SharedPrefsRepositories().setString(themeMode, mode.name);

@riverpod
Future<String?> getThemeModeSharedPrefs(
        GetThemeModeSharedPrefsRef ref, String themeMode) =>
    SharedPrefsRepositories().getString(themeMode);