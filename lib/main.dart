import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/add_to_do_controller.dart';
import 'screens/to_do_list_items_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => TODOProvider()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black.withOpacity(0.5),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const ToDoListItemsScreen(),
    );
  }
}
