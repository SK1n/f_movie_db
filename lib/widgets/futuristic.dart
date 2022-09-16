import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:get/get.dart';

/// A widget that makes it easy to execute a [Future] from a StatelessWidget.
class Futuristic<T> extends StatefulWidget {
  /// Function that returns the [Future] to execute. Not the [Future] itself.
  final AsyncValueGetter<T> futureBuilder;

  /// Whether to immediately begin executing the [Future]. If true, [initialBuilder] must be null.
  final bool autoStart;

  /// Widget to display when the [Future] has completed successfully.
  /// If null, [initialBuilder] will be displayed again.
  final Widget Function(BuildContext, AsyncSnapshot)? dataBuilder;

  final Widget Function(BuildContext)? busyBuilder;

  /// Callback to invoke when the [Future] has completed successfully.
  /// Will only be invoked once per [Future] execution.
  final ValueChanged<T>? onData;

  /// Callback to invoke when the [Future] has completed with an error.
  /// Will only be invoked once per [Future] execution.
  /// Call [VoidCallback] to start executing the [Future] again.
  final Function(Object, VoidCallback)? onError;

  const Futuristic(
      {Key? key,
      required this.futureBuilder,
      this.autoStart = true,
      this.dataBuilder,
      this.onData,
      this.busyBuilder,
      this.onError})
      : super(key: key);

  @override
  FuturisticState<T> createState() => FuturisticState<T>();
}

class FuturisticState<T> extends State<Futuristic<T>> {
  Future<T>? _future;

  @override
  void initState() {
    super.initState();
    _execute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: _future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            return _handleBusy(context);
          case ConnectionState.done:
            return _handleSnapshot(context, snapshot);
          default:
            return _defaultWidget();
        }
      },
    );
  }

  Widget _handleSnapshot(BuildContext context, AsyncSnapshot<T> snapshot) {
    if (snapshot.hasError) {
      return _handleError(snapshot.error as Object);
    }
    return _handleData(context, snapshot);
  }

  //Add error widget
  Widget _handleError(Object error) {
    EasyLoading.isShow
        ? EasyLoading.dismiss()
        : DoNothingAction(consumesKey: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/system.png',
          width: Get.width / 3,
        ),
        const Text(
            'A intervenit o eroare\n Va rugam sa reveniti mai tarziu sau sa reincercati!'),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.pink,
          ),
          onPressed: () => _execute(),
          child: const Text(
            'Incercati din nou!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _handleData(BuildContext context, AsyncSnapshot snap) {
    EasyLoading.dismiss();
    return widget.dataBuilder!(context, snap);
  }

  //Add busy widget
  Widget _handleBusy(BuildContext context) {
    if (!EasyLoading.isShow) {
      EasyLoading.show();
    }
    if (widget.busyBuilder != null && _isActive()) {
      return widget.busyBuilder!(context);
    } else {
      return Container();
    }
  }

  void _execute() {
    EasyLoading.show();
    setState(() {
      _future = widget.futureBuilder();
      _future!.then(_onData).catchError(_onError);
    });
  }

  void _onData(T data) async {
    if (widget.onData != null && _isActive()) {
      widget.onData!(data);
    }
  }

  void _onError(Object e) async {
    if (widget.onError != null && _isActive()) {
      widget.onError!(e, _execute);
    }
  }

  bool _isActive() => mounted && (ModalRoute.of(context)?.isActive ?? true);
  Widget _defaultWidget() => const SizedBox.shrink();
}
