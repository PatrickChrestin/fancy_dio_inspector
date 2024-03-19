import 'package:fancy_dio_inspector/src/loggers/fancy_dio_logger.dart';
import 'package:fancy_dio_inspector/src/models/models.dart';
import 'package:fancy_dio_inspector/src/ui/widgets/widgets.dart';
import 'package:fancy_dio_inspector/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

/// A view that displays the network requests, responses and errors.
class FancyDioInspectorTabBarView extends StatelessWidget {
  /// The options for the dio tiles.
  /// If this is `null`, the default options will be used.
  final FancyDioInspectorTileOptions tileOptions;

  /// The options for the UI localization.
  /// If any of the value is `null`, the default value will be used.
  final FancyDioInspectorL10nOptions l10nOptions;

  /// The theme data for the view. If this is `null`, `FancyThemeData` will be
  /// used.
  final ThemeData? themeData;

  const FancyDioInspectorTabBarView({
    this.tileOptions = const FancyDioInspectorTileOptions(),
    this.l10nOptions = const FancyDioInspectorL10nOptions(),
    this.themeData,
    super.key,
  });

  FancyDioLogger get _logger => FancyDioLogger.instance;

  List<NetworkRequestModel> get _requests => _logger.apiRequests;
  List<NetworkResponseModel> get _responses => _logger.apiResponses;
  List<NetworkErrorModel> get _errors => _logger.apiErrors;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Tab(
        text: l10nOptions.requestsText,
        icon: const Icon(Icons.network_check),
      ),
      Tab(
        text: l10nOptions.responsesText,
        icon: const Icon(Icons.list),
      ),
      Tab(
        text: l10nOptions.errorsText,
        icon: const Icon(Icons.error),
      ),
    ];

    final tabBarViews = [
      FancyDioTabView(
        components: _requests,
        l10nOptions: l10nOptions,
        tileOptions: tileOptions,
      ),
      FancyDioTabView(
        components: _responses,
        l10nOptions: l10nOptions,
        tileOptions: tileOptions,
      ),
      FancyDioTabView(
        components: _errors,
        l10nOptions: l10nOptions,
        tileOptions: tileOptions,
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Theme(
        data: themeData ?? context.currentTheme,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: tabBarViews,
          ),
        ),
      ),
    );
  }
}
