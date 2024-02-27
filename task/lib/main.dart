import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/view/home_layout.dart';
import 'package:task/view_model/providers/crypto_provider.dart';
import 'package:task/view_model/providers/selected_index_provider.dart';
// Import other providers if needed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SelectedIndexProvider()),
        ChangeNotifierProvider(create: (_) => CryptoProvider()),
        // Add other providers here if needed
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          canvasColor: Colors.white,
          scaffoldBackgroundColor: Color(0xFFFAF9F8),
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeLayout(),
      ),
    );
  }
}
