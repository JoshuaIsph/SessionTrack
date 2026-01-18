import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../features/home/view/home_view.dart';
import '../features/home/viewmodel/home_viewmodel.dart';

class SessionTrackApp extends StatelessWidget {
  const SessionTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SessionTrack',
        theme: ThemeData.dark(), // default dark theme
        home: const HomeView(),
      ),
    );
  }
}
