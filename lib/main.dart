import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_app/providers/cart_provider.dart';
import 'package:task_app/providers/product_provider.dart';
import 'package:task_app/screens/login_screen.dart';
import 'package:task_app/screens/product_list_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Task App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: authProvider.isAuthenticated
                ? ProductListScreen()
                : LoginScreen(),
          );
        },
      ),
    );
  }
}
