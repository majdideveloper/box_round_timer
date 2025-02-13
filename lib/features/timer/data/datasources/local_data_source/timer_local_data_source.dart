import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/timer_model.dart';

//TODO make is here own class constant
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
    final List<TimerModel> timers = await getCachedTimers();
    timers.add(timerModel);
    await _saveTimers(timers);
    return unit;
  }

  @override
  Future<List<TimerModel>> getCachedTimers() async {
    final jsonString = sharedPreferences.getString(cachedTimersKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => TimerModel.fromJson(json)).toList();
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
    //! change this becasue iuse my own uuid
    final List<TimerModel> timers = await getCachedTimers();
    final index = timers.indexWhere((timer) => timer.idTimer == idTimer);
    if (index != -1) {
      timers[index] = timerModel;
      await _saveTimers(timers);
    }
    return unit;
  }

  Future<void> _saveTimers(List<TimerModel> timers) async {
    final List<String> jsonList =
        timers.map((timer) => json.encode(timer.toJson())).toList();
    await sharedPreferences.setString(cachedTimersKey, json.encode(jsonList));
  }
}
