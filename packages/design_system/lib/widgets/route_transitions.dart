import 'dart:async';
import 'dart:math';

import 'package:design_system/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../utils/spacings.dart';

/// Custom transition page with no transition.
class NoTransition<T> extends MaterialPage<T> {
  NoTransition({
    super.key,
    super.name,
    required this.builder,
  }) : super(child: Builder(builder: builder));

  final WidgetBuilder builder;
  final Completer<T?> _transitionCompleter = Completer<T?>();

  Future<T?> get completed => _transitionCompleter.future;

  @override
  Route<T> createRoute(BuildContext context) => _NoTransitionPageRoute(
        settings: this,
        builder: builder,
      )..completed.whenComplete(_transitionCompleter.complete);
}

class _NoTransitionPageRoute<T> extends PageRouteBuilder<T> {
  _NoTransitionPageRoute({
    required RouteSettings? settings,
    required WidgetBuilder builder,
  }) : super(
          settings: settings,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          pageBuilder: (context, _, __) => Builder(builder: builder),
        );
}

/// Custom transition page with material transition.
class MaterialTransition<T> extends MaterialPage<T> {
  MaterialTransition({
    super.key,
    super.name,
    required this.builder,
  }) : super(child: Builder(builder: builder));

  final WidgetBuilder builder;
  final Completer<T?> _transitionCompleter = Completer<T?>();

  Future<T?> get completed => _transitionCompleter.future;

  @override
  Route<T> createRoute(BuildContext context) => _MaterialTransitionPageRoute(
        settings: this,
        builder: builder,
      )..completed.whenComplete(_transitionCompleter.complete);
}

class _MaterialTransitionPageRoute<T> extends MaterialPageRoute<T> {
  _MaterialTransitionPageRoute({
    required RouteSettings? settings,
    required WidgetBuilder builder,
  }) : super(
          settings: settings,
          builder: builder,
        );
}

/// Custom transition page with modal transition.
class ModalTransition<T> extends MaterialPage<T> {
  ModalTransition({
    super.key,
    this.backgroundColor,
    this.topDistance,
    this.fullScreen = false,
    super.name,
    required this.builder,
  }) : super(child: Builder(builder: builder));

  final Color? backgroundColor;
  final double? topDistance;
  final bool fullScreen;
  final WidgetBuilder builder;

  final Completer<T?> _transitionCompleter = Completer<T?>();

  Future<T?> get completed => _transitionCompleter.future;

  @override
  Route<T> createRoute(BuildContext context) => _ModalTransitionPageRoute<T>(
        settings: this,
        backgroundColor: backgroundColor,
        topDistance: topDistance,
        fullScreen: fullScreen,
        builder: builder,
      )..completed.whenComplete(_transitionCompleter.complete);
}

class _ModalTransitionPageRoute<T> extends PageRoute<T> {
  _ModalTransitionPageRoute({
    RouteSettings? settings,
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = false,
    this.barrierDismissible = true,
    Color barrierColor = Colors.black54,
    this.barrierLabel,
    this.maintainState = true,
    this.backgroundColor,
    this.topDistance,
    required this.fullScreen,
  })  : _barrierColor = barrierColor,
        super(settings: settings);

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  Color get barrierColor => _barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  final Color _barrierColor;
  final Color? backgroundColor;
  final double? topDistance;
  final bool fullScreen;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final _backgroundColor =
        backgroundColor ?? AppTheme.of(context).colorScheme.neutralTransparent;
    return Material(
      color: _backgroundColor,
      child: builder(context),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      _ModalTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        topDistance: topDistance ?? x0,
        fullScreen: fullScreen,
        child: child,
      );
}

class _ModalTransition extends StatelessWidget {
  const _ModalTransition({
    Key? key,
    required this.animation,
    required this.secondaryAnimation,
    required this.topDistance,
    required this.fullScreen,
    required this.child,
  }) : super(key: key);

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final double topDistance;
  final bool fullScreen;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final top = fullScreen ? x0 : (query.viewPadding.top + topDistance);
    final maxHeight = max(query.size.height - top, x0);
    // transitioning in and out
    final bottomUpTween = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    );
    final newChild = SlideTransition(
      position: animation.drive(bottomUpTween),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: topDistance != x0 ? maxHeight : x0,
          maxHeight: maxHeight,
        ),
        child: child,
      ),
    );
    return MediaQuery.removePadding(
      context: context,
      removeTop: !fullScreen,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: newChild,
      ),
    );
  }
}
