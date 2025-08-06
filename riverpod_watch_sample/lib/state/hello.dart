import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello.g.dart';

@riverpod
String hello(Ref ref) {
  return 'Hello!!';
}
