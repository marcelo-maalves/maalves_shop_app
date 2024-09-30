import 'package:flutter/widgets.dart';

/// A empty [Widget] instance which is not in the layout and does nothing.
/// It is useful when you have to return a widget and can't return null.
const emptyWidget = EmptyWidget();

final class EmptyWidget extends Widget {
  const EmptyWidget() : super();

  @override
  Element createElement() => _EmptyElement(this);
}

final class _EmptyElement extends Element {
  _EmptyElement(EmptyWidget widget) : super(widget);

  @override
  void mount(Element? parent, dynamic newSlot) {
    assert(parent is! MultiChildRenderObjectElement, """
        You are using empty widget under a MultiChildRenderObjectElement.
        This suggests a possibility that the empty widget is not needed or is being used improperly.
        Make sure it can't be replaced with an inline conditional or
        omission of the target widget from a list.
        """);

    super.mount(parent, newSlot);
  }

  @override
  bool get debugDoingBuild => false;

  @override
  bool get dirty => false;
}
