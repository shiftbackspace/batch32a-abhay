import 'package:Busx/app/app.dart';
// ignore: depend_on_referenced_packages
import 'package:Busx/core/networking/local/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
