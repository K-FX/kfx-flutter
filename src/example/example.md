# DateTime extension

## Relative Time

```dart
final now = DateTime(2000, 1, 15);
final then = DateTime(2000, 1, 20);

print(then.toRelativeString(now: now, language: "en"));
```

Should result in `"5 days"` (either in past of future, you can complement with "ago" or "in" on the UI level)