import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hobby_hub_app/common/utils/logger.dart';
import 'package:hobby_hub_app/user/providers/auth_provider.dart';

final routeProvider = Provider<GoRouter>((ref) {
  final provider = ref.read(authProvider);

  return GoRouter(
    routes: provider.routes,
    initialLocation: '/splash',
    refreshListenable: provider,
    // redirect: provider.redirectLogic,
    observers: [
      GoRouterObserver(),
    ],
  );
});

class GoRouterObserver extends NavigatorObserver {
  final List<Route<dynamic>?> _history = <Route<dynamic>?>[];

  String getHistoryToString() {
    return _history
        .map((element) => element!.settings.name)
        .toList()
        .toString();
  }

  List<Route<dynamic>> classHistories = [];

  List<String?> getHistories() {
    return _history.map((element) => element!.settings.name).toList();
  }

  Route? get top => _history.last;

  final List<Route<dynamic>?> _poppedRoutes = <Route<dynamic>?>[];

  final StreamController _historyChangeStreamController =
      StreamController.broadcast();

  Stream get historyChangeStream => _historyChangeStreamController.stream;

  @override
  void didPush(Route route, Route? previousRoute) {
    _history.add(route);
    _poppedRoutes.remove(route);
    try {
      classHistories.add(route);
    } catch (e) {}
    _historyChangeStreamController.add(HistoryChange(
      action: NavigationStackAction.push,
      newRoute: route,
      oldRoute: previousRoute,
    ));
    HobbyLog().i('History Observer : didPush \n ${getHistoryToString()}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _poppedRoutes.add(_history.last);

    try {
      classHistories.removeLast();
    } catch (e) {}
    _history.removeLast();
    _historyChangeStreamController.add(HistoryChange(
      action: NavigationStackAction.pop,
      newRoute: route,
      oldRoute: previousRoute,
    ));

    HobbyLog().i('History Observer : didPop \n ${getHistoryToString()}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _history.remove(route);
    try {
      classHistories.remove(route);
    } catch (e) {}
    _historyChangeStreamController.add(HistoryChange(
      action: NavigationStackAction.remove,
      newRoute: route,
      oldRoute: previousRoute,
    ));
    HobbyLog().i('History Observer : didRemove \n ${getHistoryToString()}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route? oldRoute}) {
    try {
      if (newRoute is MaterialPageRoute) {
        classHistories.removeLast();
        classHistories.add(newRoute);
      }
    } catch (e) {}
    int oldRouteIndex = _history.indexOf(oldRoute);
    _history.replaceRange(oldRouteIndex, oldRouteIndex + 1, [newRoute]);
    _historyChangeStreamController.add(HistoryChange(
      action: NavigationStackAction.replace,
      newRoute: newRoute,
      oldRoute: oldRoute,
    ));
    HobbyLog().i('History Observer : didReplace \n ${getHistoryToString()}');
  }
}

class HistoryChange {
  HistoryChange({this.action, this.newRoute, this.oldRoute});

  final NavigationStackAction? action;
  final Route<dynamic>? newRoute;
  final Route<dynamic>? oldRoute;
}

enum NavigationStackAction { push, pop, remove, replace }
