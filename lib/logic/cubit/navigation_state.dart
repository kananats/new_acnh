part of 'navigation_cubit.dart';

@immutable
class NavigationState extends Equatable {
  final List<Widget> pages;
  late final List<Completer<dynamic>> _handlers;

  NavigationState(this.pages, {List<Completer<dynamic>>? handlers}) {
    _handlers = handlers ?? pages.map((e) => Completer<dynamic>()).toList();
  }

  @override
  List<Object?> get props => [pages, _handlers];

  /// Currently shown page
  Widget? get currentPage => pages.isNotEmpty ? pages.last : null;

  /// Future that returns pop result
  Future<dynamic> get result => _handlers.last.future;

  /// Creates a new state which pushes [page] to the stack
  ///
  /// Returns unmodified state if [page] with the same [key] is found in the
  /// stack
  NavigationState push(Widget page) {
    if (page.key != null && pages.any((element) => element.key == page.key))
      return this;

    final newPages = [...pages, page];
    final newHandlers = [..._handlers, Completer<dynamic>()];

    return NavigationState(newPages, handlers: newHandlers);
  }

  /// Creates a new state which pops top most page from the stack
  ///
  /// Returns unmodified state if [pages] is empty
  NavigationState pop([dynamic result]) {
    if (pages.isEmpty) return this;

    final newPages = [...pages]..removeLast();
    final newHandlers = [..._handlers];
    final handler = newHandlers.removeLast();
    handler.complete(result);

    return NavigationState(newPages, handlers: newHandlers);
  }

  /// Creates a new state which pops until the predicate is satisfied
  ///
  /// Returns unmodified state if [pages] is empty, or no page is popped, or
  /// there is no page in which the predicate is satisfied
  NavigationState popUntil(bool Function(Widget widget) predicate) {
    if (pages.isEmpty) return this;
    if (predicate(pages.last)) return this;
    if (!pages.any((page) => predicate(page))) return this;

    return pop().popUntil(predicate);
  }

  /// Creates a new state which pops until one (or less) page is remained
  ///
  /// Returns unmodified state if [pages] is empty or no page is popped
  NavigationState popUntilRoot() {
    if (pages.length <= 1) return this;

    return pop().popUntilRoot();
  }

  /// Creates a new state which pops until no page is remained
  ///
  /// Returns unmodified state if [pages] is empty
  NavigationState popUntilEmpty() {
    if (pages.isEmpty) return this;

    return pop().popUntilEmpty();
  }

  /// To use with Navigator.onPopPage
  NavigationState onPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result) || pages.isEmpty) return this;

    final newPages = [
      ...pages,
    ]..removeLast();

    final newHandlers = [
      ..._handlers,
    ];

    newHandlers.removeLast().complete(null);

    return NavigationState(newPages, handlers: newHandlers);
  }
}
