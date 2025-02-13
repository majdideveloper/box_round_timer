// import 'dart:convert';
import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/timer_model.dart';

// Constant key for SharedPreferences
const String cachedTimersKey = "CACHED_TIMERS";

abstract class TimerLocalDataSource {
  Future<List<TimerModel>> getCachedTimers();
  Future<Unit> addTimer(TimerModel timerModel);
  Future<Unit> updateTimer(String id, TimerModel timerModel);
  Future<Unit> removeTimer(String idTimer);
}

class TimerLocalDataSourceImpl implements TimerLocalDataSource {
  final SharedPreferences sharedPreferences;

  TimerLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> addTimer(TimerModel timerModel) async {
    log("Before getCachedTimers");
    final List<TimerModel> timers = await getCachedTimers();
    log("Fetched timers, adding new one.");
    timers.add(timerModel);
    await _saveTimers(timers);
    return unit;
  }

  @override
  Future<List<TimerModel>> getCachedTimers() async {
    final jsonString = sharedPreferences.getString(cachedTimersKey);

    if (jsonString != null) {
      try {
        final List<dynamic> jsonList = jsonDecode(jsonString);
        log("Decoded JSON list: $jsonList");

        // Check if the list is valid before mapping
        if (jsonList is List &&
            jsonList.isNotEmpty &&
            jsonList.first is Map<String, dynamic>) {
          return jsonList
              .map((json) => TimerModel.fromJson(json as Map<String, dynamic>))
              .toList();
        } else {
          log("Error: Stored data is not in the correct format.");
          return [];
        }
      } catch (e) {
        log("Error decoding JSON: $e");
        return [];
      }
    }
    return [];
  }

  @override
  Future<Unit> removeTimer(String idTimer) async {
    final List<TimerModel> timers = await getCachedTimers();
    timers.removeWhere((timer) => timer.idTimer == idTimer);
    await _saveTimers(timers);
    return unit;
  }

  @override
  Future<Unit> updateTimer(String idTimer, TimerModel timerModel) async {
    final List<TimerModel> timers = await getCachedTimers();
    final index = timers.indexWhere((timer) => timer.idTimer == idTimer);
    if (index != -1) {
      timers[index] = timerModel;
      await _saveTimers(timers);
    }
    return unit;
  }

  Future<void> _saveTimers(List<TimerModel> timers) async {
    final List<Map<String, dynamic>> jsonList =
        timers.map((timer) => timer.toJson()).toList();
    final String jsonString = jsonEncode(jsonList);
    await sharedPreferences.setString(cachedTimersKey, jsonString);
  }
}
