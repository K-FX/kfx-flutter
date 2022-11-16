![building](https://github.com/K-FX/kfx-flutter/actions/workflows/dart.yml/badge.svg)

# Features

This is a personal helper library I use to make Flutter applications, with internacionalization support (initially, in English and Portuguese, as the latter is my mother tongue)

So far, we have this:

## Extensions methods

A list of extension methods to increment Dart/Flutter functionalities.

### `DateTime` extensions

#### Relative Time

`someDateTime.toRelativeTime()` shows a relative time between now and the specified date, in english (or portuguese, the library is always multi language and you can help translate it to your language). For example: now, 1 day, 5 days, a week, 1 month, 5 months, a year, etc. This is not meant as a precise relative time, but rather an approximate one (i.e.: 9 days will show `a week` as response). The time is always absolute (meaning: it doesn't matter if is "in a week" or "a week ago", both are returned as `a week`). Months are logical (meaning: 11/nov/2000 to 11/oct/2001 is 11 months, not 13 as many algorithms says (because they calculate the difference between the numbers of the months, disregarding that, for common usage, 28/mar is 1 month after 28/feb))
