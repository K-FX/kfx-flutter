library kfx_flutter;

part 'relative_time.i18n.dart';

/// [DateTime] extensions for relative past time (ex.: 2 months to something happened 2 months ago)
extension DateTimeExtensionsRelativeTime on DateTime {
  /// Converts the difference between two dates into a relative time text.
  ///
  /// [languageCode] designates the language in which the text will appear (see source-code for translations options).
  /// [now] is the present time (if null, it gets the current time from `DateTime.now()`)
  String toRelativeString({String? languageCode, DateTime? now}) {
    now ??= DateTime.now();

    final local = toLocal();
    final difference = local.difference(now).abs();
    final minutes = difference.inMinutes;

    if (minutes == 0) {
      return _i18n("now", languageCode);
    }

    final hours = difference.inHours;

    if (hours == 0) {
      return "$minutes ${_i18n("min", languageCode)}";
    }

    if (hours < 24) {
      final h = (difference.inMicroseconds / Duration.microsecondsPerHour) - hours;

      return "$hours${h == 0 ? "" : _i18n("½", languageCode)} ${_i18n("hr", languageCode)}";
    }

    if (hours < 48) {
      return _i18n("1 day", languageCode);
    }

    if (difference.inDays < 7) {
      return "${difference.inDays} ${_i18n("days", languageCode)}";
    }

    final weeks = difference.inDays ~/ 7;

    if (weeks == 1) {
      return _i18n("a week", languageCode);
    }

    if (weeks < 4) {
      return "$weeks ${_i18n("weeks", languageCode)}";
    }

    if (difference.inDays > 364) {
      final years = (now.year - local.year).abs();

      if (years == 1) {
        return _i18n("a year", languageCode);
      }

      return "$years ${_i18n("years", languageCode)}";
    }

    final months = (difference.inDays / 30.4167).round();

    if (months == 1) {
      return _i18n("1 month", languageCode);
    }

    return "$months ${_i18n("months", languageCode)}";
  }
}
