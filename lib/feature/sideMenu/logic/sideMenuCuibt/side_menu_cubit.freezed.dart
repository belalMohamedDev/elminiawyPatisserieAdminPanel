// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'side_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SideMenuState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String selectedPage) pageSelected,
    required TResult Function(List<int> expandedIndexes) toggleExpansion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String selectedPage)? pageSelected,
    TResult? Function(List<int> expandedIndexes)? toggleExpansion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String selectedPage)? pageSelected,
    TResult Function(List<int> expandedIndexes)? toggleExpansion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PageSelected value) pageSelected,
    required TResult Function(_ToggleExpansion value) toggleExpansion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PageSelected value)? pageSelected,
    TResult? Function(_ToggleExpansion value)? toggleExpansion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PageSelected value)? pageSelected,
    TResult Function(_ToggleExpansion value)? toggleExpansion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SideMenuStateCopyWith<$Res> {
  factory $SideMenuStateCopyWith(
          SideMenuState value, $Res Function(SideMenuState) then) =
      _$SideMenuStateCopyWithImpl<$Res, SideMenuState>;
}

/// @nodoc
class _$SideMenuStateCopyWithImpl<$Res, $Val extends SideMenuState>
    implements $SideMenuStateCopyWith<$Res> {
  _$SideMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SideMenuStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SideMenuState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String selectedPage) pageSelected,
    required TResult Function(List<int> expandedIndexes) toggleExpansion,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String selectedPage)? pageSelected,
    TResult? Function(List<int> expandedIndexes)? toggleExpansion,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String selectedPage)? pageSelected,
    TResult Function(List<int> expandedIndexes)? toggleExpansion,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PageSelected value) pageSelected,
    required TResult Function(_ToggleExpansion value) toggleExpansion,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PageSelected value)? pageSelected,
    TResult? Function(_ToggleExpansion value)? toggleExpansion,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PageSelected value)? pageSelected,
    TResult Function(_ToggleExpansion value)? toggleExpansion,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SideMenuState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$PageSelectedImplCopyWith<$Res> {
  factory _$$PageSelectedImplCopyWith(
          _$PageSelectedImpl value, $Res Function(_$PageSelectedImpl) then) =
      __$$PageSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String selectedPage});
}

/// @nodoc
class __$$PageSelectedImplCopyWithImpl<$Res>
    extends _$SideMenuStateCopyWithImpl<$Res, _$PageSelectedImpl>
    implements _$$PageSelectedImplCopyWith<$Res> {
  __$$PageSelectedImplCopyWithImpl(
      _$PageSelectedImpl _value, $Res Function(_$PageSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedPage = null,
  }) {
    return _then(_$PageSelectedImpl(
      null == selectedPage
          ? _value.selectedPage
          : selectedPage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PageSelectedImpl implements _PageSelected {
  const _$PageSelectedImpl(this.selectedPage);

  @override
  final String selectedPage;

  @override
  String toString() {
    return 'SideMenuState.pageSelected(selectedPage: $selectedPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageSelectedImpl &&
            (identical(other.selectedPage, selectedPage) ||
                other.selectedPage == selectedPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageSelectedImplCopyWith<_$PageSelectedImpl> get copyWith =>
      __$$PageSelectedImplCopyWithImpl<_$PageSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String selectedPage) pageSelected,
    required TResult Function(List<int> expandedIndexes) toggleExpansion,
  }) {
    return pageSelected(selectedPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String selectedPage)? pageSelected,
    TResult? Function(List<int> expandedIndexes)? toggleExpansion,
  }) {
    return pageSelected?.call(selectedPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String selectedPage)? pageSelected,
    TResult Function(List<int> expandedIndexes)? toggleExpansion,
    required TResult orElse(),
  }) {
    if (pageSelected != null) {
      return pageSelected(selectedPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PageSelected value) pageSelected,
    required TResult Function(_ToggleExpansion value) toggleExpansion,
  }) {
    return pageSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PageSelected value)? pageSelected,
    TResult? Function(_ToggleExpansion value)? toggleExpansion,
  }) {
    return pageSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PageSelected value)? pageSelected,
    TResult Function(_ToggleExpansion value)? toggleExpansion,
    required TResult orElse(),
  }) {
    if (pageSelected != null) {
      return pageSelected(this);
    }
    return orElse();
  }
}

abstract class _PageSelected implements SideMenuState {
  const factory _PageSelected(final String selectedPage) = _$PageSelectedImpl;

  String get selectedPage;
  @JsonKey(ignore: true)
  _$$PageSelectedImplCopyWith<_$PageSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleExpansionImplCopyWith<$Res> {
  factory _$$ToggleExpansionImplCopyWith(_$ToggleExpansionImpl value,
          $Res Function(_$ToggleExpansionImpl) then) =
      __$$ToggleExpansionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> expandedIndexes});
}

/// @nodoc
class __$$ToggleExpansionImplCopyWithImpl<$Res>
    extends _$SideMenuStateCopyWithImpl<$Res, _$ToggleExpansionImpl>
    implements _$$ToggleExpansionImplCopyWith<$Res> {
  __$$ToggleExpansionImplCopyWithImpl(
      _$ToggleExpansionImpl _value, $Res Function(_$ToggleExpansionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expandedIndexes = null,
  }) {
    return _then(_$ToggleExpansionImpl(
      null == expandedIndexes
          ? _value._expandedIndexes
          : expandedIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$ToggleExpansionImpl implements _ToggleExpansion {
  const _$ToggleExpansionImpl(final List<int> expandedIndexes)
      : _expandedIndexes = expandedIndexes;

  final List<int> _expandedIndexes;
  @override
  List<int> get expandedIndexes {
    if (_expandedIndexes is EqualUnmodifiableListView) return _expandedIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expandedIndexes);
  }

  @override
  String toString() {
    return 'SideMenuState.toggleExpansion(expandedIndexes: $expandedIndexes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleExpansionImpl &&
            const DeepCollectionEquality()
                .equals(other._expandedIndexes, _expandedIndexes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_expandedIndexes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleExpansionImplCopyWith<_$ToggleExpansionImpl> get copyWith =>
      __$$ToggleExpansionImplCopyWithImpl<_$ToggleExpansionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String selectedPage) pageSelected,
    required TResult Function(List<int> expandedIndexes) toggleExpansion,
  }) {
    return toggleExpansion(expandedIndexes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String selectedPage)? pageSelected,
    TResult? Function(List<int> expandedIndexes)? toggleExpansion,
  }) {
    return toggleExpansion?.call(expandedIndexes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String selectedPage)? pageSelected,
    TResult Function(List<int> expandedIndexes)? toggleExpansion,
    required TResult orElse(),
  }) {
    if (toggleExpansion != null) {
      return toggleExpansion(expandedIndexes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PageSelected value) pageSelected,
    required TResult Function(_ToggleExpansion value) toggleExpansion,
  }) {
    return toggleExpansion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PageSelected value)? pageSelected,
    TResult? Function(_ToggleExpansion value)? toggleExpansion,
  }) {
    return toggleExpansion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PageSelected value)? pageSelected,
    TResult Function(_ToggleExpansion value)? toggleExpansion,
    required TResult orElse(),
  }) {
    if (toggleExpansion != null) {
      return toggleExpansion(this);
    }
    return orElse();
  }
}

abstract class _ToggleExpansion implements SideMenuState {
  const factory _ToggleExpansion(final List<int> expandedIndexes) =
      _$ToggleExpansionImpl;

  List<int> get expandedIndexes;
  @JsonKey(ignore: true)
  _$$ToggleExpansionImplCopyWith<_$ToggleExpansionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
