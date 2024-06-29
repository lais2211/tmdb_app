// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchPageController on _SearchPageControllerBase, Store {
  late final _$textEditingControllerAtom = Atom(
      name: '_SearchPageControllerBase.textEditingController',
      context: context);

  @override
  TextEditingController get textEditingController {
    _$textEditingControllerAtom.reportRead();
    return super.textEditingController;
  }

  @override
  set textEditingController(TextEditingController value) {
    _$textEditingControllerAtom.reportWrite(value, super.textEditingController,
        () {
      super.textEditingController = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SearchPageControllerBase.isLoading', context: context);

  @override
  WidgetStatus? get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(WidgetStatus? value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$appStatusAtom =
      Atom(name: '_SearchPageControllerBase.appStatus', context: context);

  @override
  WidgetStatus? get appStatus {
    _$appStatusAtom.reportRead();
    return super.appStatus;
  }

  @override
  set appStatus(WidgetStatus? value) {
    _$appStatusAtom.reportWrite(value, super.appStatus, () {
      super.appStatus = value;
    });
  }

  late final _$isSearchingAtom =
      Atom(name: '_SearchPageControllerBase.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$getSearchMoviesAsyncAction = AsyncAction(
      '_SearchPageControllerBase.getSearchMovies',
      context: context);

  @override
  Future<void> getSearchMovies({required int page, required String search}) {
    return _$getSearchMoviesAsyncAction
        .run(() => super.getSearchMovies(page: page, search: search));
  }

  @override
  String toString() {
    return '''
textEditingController: ${textEditingController},
isLoading: ${isLoading},
appStatus: ${appStatus},
isSearching: ${isSearching}
    ''';
  }
}
