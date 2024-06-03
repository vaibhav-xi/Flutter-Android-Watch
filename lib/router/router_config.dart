import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:roomlights/features/home/homescreen.dart';
import 'package:roomlights/features/navigation/navigation.dart';
import 'package:roomlights/router/router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: Routes.navigaiton.path,
    name: Routes.navigaiton.name,
    pageBuilder: (context, state) {
      return const CupertinoPage(child: Navigation());
    },
  ),
   GoRoute(
    path: Routes.homescreen.path,
    name: Routes.homescreen.name,
    pageBuilder: (context, state) {
      return  const CupertinoPage(child: HomeScreenView());
    },
  ),
]);
