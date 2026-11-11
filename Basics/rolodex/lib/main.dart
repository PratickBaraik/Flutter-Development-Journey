
import 'package:cupertino_ui/cupertino_ui.dart';

import 'screens/adaptive_layout.dart';

void main() {
  runApp(const RolodexApp());
}

class RolodexApp extends StatelessWidget {
  const RolodexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Rolodex',
      debugShowCheckedModeBanner: false,

      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
        scaffoldBackgroundColor: Color(0xFFF5F5F7),
        barBackgroundColor: Color(0xFFF9F9F9),
        textTheme: CupertinoTextThemeData(
          primaryColor: Color(0xFF007AFF),
        ),
      ),

      home: const AdaptiveLayout(),
    );
  }
}
