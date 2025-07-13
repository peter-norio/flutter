import 'package:flutter/material.dart';
import 'package:riverpod_sample/no_generator/notifierprovider_counter.dart';
import 'package:riverpod_sample/no_generator/provider_hello.dart';
import 'package:riverpod_sample/use_generator/simple/class_counter.dart';
import 'package:riverpod_sample/use_generator/future/class_future_counter.dart';
import 'package:riverpod_sample/use_generator/param/class_param_counter.dart';
import 'package:riverpod_sample/use_generator/future/fn_future_hello.dart';
import 'package:riverpod_sample/use_generator/future/fn_future_multi_async.dart';
import 'package:riverpod_sample/use_generator/simple/fn_hello.dart';
import 'package:riverpod_sample/use_generator/param/fn_param_hello.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app bar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hello(),
          Counter(),
          GeneratorHello(),
          GeneratorCounter(),
          FutureHello(),
          FutureCounter(),
          FutureMutltiAsync(),
          ParamHello(),
          ParamCounter(),
        ],
      ),
    );
  }
}
