import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:planet_app/core/api_server.dart';

customShowSnackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}

GetIt getIt = GetIt.instance;
void setupCustom() {
  getIt.registerSingleton<ApiServer>(ApiServer());
}
