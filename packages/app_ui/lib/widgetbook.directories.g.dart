// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_ui/src/colors/app_colors.stories.dart'
    as _app_ui_src_colors_app_colors_stories;
import 'package:app_ui/src/introduction/app_welcome.stories.dart'
    as _app_ui_src_introduction_app_welcome_stories;
import 'package:app_ui/src/widgets/app_button.stories.dart'
    as _app_ui_src_widgets_app_button_stories;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'colors',
    children: [
      _widgetbook.WidgetbookLeafComponent(
        name: 'ColorPalette',
        useCase: _widgetbook.WidgetbookUseCase(
          name: 'Palette',
          builder: _app_ui_src_colors_app_colors_stories.colorPalette,
        ),
      )
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'introduction',
    children: [
      _widgetbook.WidgetbookLeafComponent(
        name: 'AppWelcome',
        useCase: _widgetbook.WidgetbookUseCase(
          name: 'Welcome',
          builder: _app_ui_src_introduction_app_welcome_stories.appWelcome,
        ),
      )
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'AppButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Colored',
            builder: _app_ui_src_widgets_app_button_stories.coloredButton,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Primary',
            builder: _app_ui_src_widgets_app_button_stories.primaryButton,
          ),
        ],
      )
    ],
  ),
];
