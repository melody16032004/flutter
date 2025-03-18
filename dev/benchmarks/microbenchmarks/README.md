# microbenchmarks

To run these benchmarks on a device, first run `flutter logs` in one
window to see the device logs, then, in a different window, run:

<<<<<<< HEAD
```sh
flutter run -d $DEVICE_ID --profile lib/benchmark_collection.dart
=======
```
flutter run --release lib/gestures/velocity_tracker_bench.dart
flutter run --release lib/gestures/gesture_detector_bench.dart
flutter run --release lib/stocks/animation_bench.dart
flutter run --release lib/stocks/build_bench.dart
flutter run --release lib/stocks/layout_bench.dart
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
```

To run a subset of tests:

```shell
flutter run -d $DEVICE_ID --profile lib/benchmark_collection.dart --dart-define=tests=foundation/change_notifier_bench.dart,language/sync_star_bench.dart
```

To specify a seed value for shuffling tests:

```shell
flutter run -d $DEVICE_ID --profile lib/benchmark_collection.dart --dart-define=seed=12345
```


The results should be in the device logs.

## Avoid changing names of the benchmarks

Each microbenchmark is identified by a name, for example,
"catmullrom_transform_iteration". Changing the name passed to `BenchmarkResultPrinter.addResult`
will effectively remove the old benchmark and create a new one,
losing the historical data associated with the old benchmark in the process.
