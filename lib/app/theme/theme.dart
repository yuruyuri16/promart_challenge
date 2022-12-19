import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  static final lightTheme = FlexThemeData.light(
    useMaterial3: true,
    scheme: FlexScheme.amber,
  );
  static final darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.shark,
  );
}
