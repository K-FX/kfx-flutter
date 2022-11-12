import 'package:flutter_test/flutter_test.dart';

import 'package:kfx_flutter/extensions/date_time/relative_time.dart';

void main() {
  test("DateTime extension RelativeTime tests", () {
    final now = DateTime(2000, 6, 15, 12, 30, 30);

    expect(now.add(const Duration(seconds: 30)).toRelativeString(now: now), "now");
    expect(now.add(const Duration(seconds: 60)).toRelativeString(now: now), "1 min");
    expect(now.add(const Duration(seconds: 90)).toRelativeString(now: now), "1 min");
    expect(now.add(const Duration(seconds: 119)).toRelativeString(now: now), "1 min");
    expect(now.add(const Duration(seconds: 120)).toRelativeString(now: now), "2 min");

    expect(now.add(const Duration(minutes: 15)).toRelativeString(now: now), "15 min");
    expect(now.add(const Duration(minutes: 30)).toRelativeString(now: now), "30 min");
    expect(now.add(const Duration(minutes: 45)).toRelativeString(now: now), "45 min");
    expect(now.add(const Duration(minutes: 59)).toRelativeString(now: now), "59 min");

    expect(now.add(const Duration(minutes: 60)).toRelativeString(now: now), "1 hr");
    expect(now.add(const Duration(minutes: 90)).toRelativeString(now: now), "1½ hr");
    expect(now.add(const Duration(minutes: 120)).toRelativeString(now: now), "2 hr");
    expect(now.add(const Duration(minutes: 150)).toRelativeString(now: now), "2½ hr");
    expect(now.add(const Duration(hours: 23, minutes: 59, seconds: 59)).toRelativeString(now: now), "23½ hr");

    expect(now.add(const Duration(hours: 24)).toRelativeString(now: now), "1 day");
    expect(now.add(const Duration(hours: 36)).toRelativeString(now: now), "1 day");
    expect(now.add(const Duration(hours: 48)).toRelativeString(now: now), "2 days");
    expect(now.add(const Duration(hours: 72)).toRelativeString(now: now), "3 days");

    expect(now.add(const Duration(days: 7)).toRelativeString(now: now), "a week");
    expect(now.add(const Duration(days: 9)).toRelativeString(now: now), "a week");
    expect(now.add(const Duration(days: 14)).toRelativeString(now: now), "2 weeks");
    expect(now.add(const Duration(days: 21)).toRelativeString(now: now), "3 weeks");
    expect(now.add(const Duration(days: 28)).toRelativeString(now: now), "1 month");

    expect(DateTime(now.year, now.month + 1, now.day, now.hour, now.minute, now.second).toRelativeString(now: now), "1 month");
    expect(DateTime(now.year, now.month + 2, now.day, now.hour, now.minute, now.second).toRelativeString(now: now), "2 months");
    expect(DateTime(now.year, now.month + 11, now.day, now.hour, now.minute, now.second).toRelativeString(now: now), "11 months");
    expect(DateTime(now.year, now.month + 12, now.day, now.hour, now.minute, now.second).toRelativeString(now: now), "a year");
  });
}
