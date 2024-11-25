part of 'side_menu_cubit.dart';

@freezed
class SideMenuState with _$SideMenuState {
  const factory SideMenuState.initial() = _Initial;
  const factory SideMenuState.pageSelected(String selectedPage) = _PageSelected;

  const factory SideMenuState.toggleExpansion(
    List<int> expandedIndexes,
  ) = _ToggleExpansion;
}
