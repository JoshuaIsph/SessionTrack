import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../features/screen1/viewmodel/screen1_viewmodel.dart';
import '../features/screen2/viewmodel/screen2_viewmodel.dart';
import '../features/screen3/viewmodel/screen3_viewmodel.dart';
import 'screen_manager.dart';
import 'screen_manager_viewmodel.dart';

class SessionTrackApp extends StatelessWidget {
  const SessionTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ViewModels for each screen
        ChangeNotifierProvider(create: (_) => Screen1ViewModel()),
        ChangeNotifierProvider(create: (_) => Screen2ViewModel()),
        ChangeNotifierProvider(create: (_) => Screen3ViewModel()),
        // Screen manager ViewModel
        ChangeNotifierProvider(create: (_) => ScreenManagerViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SessionTrack',
        theme: ThemeData.dark(),
        home: const ScreenManager(),
      ),
    );
  }
}
