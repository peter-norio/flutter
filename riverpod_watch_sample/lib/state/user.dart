import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  User build() {
    return User(name: 'John', age: 10);
  }

  // 状態の更新
  void updateState({String? newName, int? newAge}) {
    state = state.copyWith(name: newName, age: newAge);
  }
}

// User型
class User {
  String name;
  int age;

  User({required this.name, required this.age});

  // 渡された引数の項目のみ更新した新しいオブジェクトを生成
  User copyWith({String? name, int? age}) {
    return User(name: name ?? this.name, age: age ?? this.age);
  }
}
