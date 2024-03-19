import 'package:fancy_dio_inspector/fancy_dio_inspector.dart';
import 'package:fancy_dio_inspector/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

/// A view that displays the network requests, responses and errors.
class FancyDioInspectorView extends StatelessWidget {
  /// The options for the dio tiles.
  /// If this is `null`, the default options will be used.
  final FancyDioInspectorTileOptions tileOptions;

  /// The options for the UI localization.
  /// If any of the value is `null`, the default value will be used.
  final FancyDioInspectorL10nOptions l10nOptions;

  /// [leading] is used to place a widget before the title.
  final Widget? leading;

  /// [actions] are used to place widgets after the title.
  final List<Widget>? actions;

  /// The theme data for the view. If this is `null`, `FancyThemeData` will be
  /// used.
  final ThemeData? themeData;

  const FancyDioInspectorView({
    this.tileOptions = const FancyDioInspectorTileOptions(),
    this.l10nOptions = const FancyDioInspectorL10nOptions(),
    this.leading,
    this.actions,
    this.themeData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData ?? context.currentTheme,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(l10nOptions.appBarText),
          leading: leading,
          actions: actions,
        ),
        body: FancyDioInspectorTabBarView(
          tileOptions: tileOptions,
          l10nOptions: l10nOptions,
          themeData: themeData ?? context.currentTheme,
        ),
      ),
    );
  }
}
