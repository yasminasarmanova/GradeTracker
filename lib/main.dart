import 'package:flutter/material.dart';
import 'package:grade_tracker/auth_page.dart';
import 'package:grade_tracker/home_page.dart';
import 'package:grade_tracker/login_page.dart';
import 'package:grade_tracker/subject_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://pigrejmjponznjvyebhy.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZ3Jlam1qcG9uem5qdnllYmh5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjEzODYyNjksImV4cCI6MjA3Njk2MjI2OX0.bKzDt8MWn8vTZSI9X1k1C50inNWJ11nZw3viRa5rmPE',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grade Tracker',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF661E35)),
        fontFamily: 'Montserrat', // <-- вот здесь устанавливаем по умолчанию
        primaryColor: const Color(0xFF762640),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF762640),
          foregroundColor: Colors.white,
        ),
      ),

      // 👇 Указываем стартовую страницу через AuthGate
      home: const HomePage(),

      // 👇 Регистрируем все маршруты
      routes: {
        '/auth': (context) => const AuthPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },


      onGenerateRoute: (settings) {
  if (settings.name == '/subject') {
    final args = settings.arguments as Map<String, dynamic>;
    return MaterialPageRoute(
      builder: (_) => SubjectPage(
        subject: args, 
      ),
    );
  }
  return null;
},

    );
  }
}

/// 🔒 Проверяет, вошёл ли пользователь в систему
class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    _redirectUser();
  }

  Future<void> _redirectUser() async {
    await Future.delayed(const Duration(seconds: 1)); // лёгкая задержка
    final session = Supabase.instance.client.auth.currentSession;

    if (!mounted) return;

    if (session != null) {
      // если пользователь авторизован — на HomePage
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // если нет — на страницу авторизации
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF762640),
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
