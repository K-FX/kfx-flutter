import 'package:flutter_test/flutter_test.dart';

import 'package:kfx_flutter/extensions/date_time/relative_time.dart';

void main() {
  final now = DateTime(2000, 6, 15, 12, 30, 30);
  final tests = <DateTime, String>{};

  tests[now.add(const Duration(seconds: 3))] = "now";
  tests[now.add(const Duration(seconds: 60))] = "1 min";
  tests[now.add(const Duration(seconds: 90))] = "1 min";
  tests[now.add(const Duration(seconds: 119))] = "1 min";
  tests[now.add(const Duration(seconds: 120))] = "2 min";
  tests[now.add(const Duration(minutes: 15))] = "15 min";
  tests[now.add(const Duration(minutes: 30))] = "30 min";
  tests[now.add(const Duration(minutes: 45))] = "45 min";
  tests[now.add(const Duration(minutes: 59))] = "59 min";
  tests[now.add(const Duration(minutes: 60))] = "1 hr";
  tests[now.add(const Duration(minutes: 90))] = "1½ hr";
  tests[now.add(const Duration(minutes: 120))] = "2 hr";
  tests[now.add(const Duration(minutes: 150))] = "2½ hr";
  tests[now.add(const Duration(hours: 23, minutes: 59, seconds: 59))] = "23½ hr";
  tests[now.add(const Duration(hours: 24))] = "1 day";
  tests[now.add(const Duration(hours: 36))] = "1 day";
  tests[now.add(const Duration(hours: 48))] = "2 days";
  tests[now.add(const Duration(hours: 72))] = "3 days";
  tests[now.add(const Duration(days: 7))] = "a week";
  tests[now.add(const Duration(days: 9))] = "a week";
  tests[now.add(const Duration(days: 14))] = "2 weeks";
  tests[now.add(const Duration(days: 21))] = "3 weeks";
  tests[now.add(const Duration(days: 28))] = "1 month";
  tests[DateTime(now.year, now.month + 1, now.day, now.hour, now.minute, now.second)] = "1 month";
  tests[DateTime(now.year, now.month + 2, now.day, now.hour, now.minute, now.second)] = "2 months";
  tests[DateTime(now.year, now.month + 11, now.day, now.hour, now.minute, now.second)] = "11 months";
  tests[DateTime(now.year, now.month + 12, now.day, now.hour, now.minute, now.second)] = "a year";

  for (final testEntry in tests.entries) {
    final description = "$now to ${testEntry.key} = ${testEntry.value}";

    test(description, () => expect(testEntry.key.toRelativeString(now: now), testEntry.value));
  }
}
