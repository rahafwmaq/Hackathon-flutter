import 'package:digital_card/bloc/digital_card_bloc.dart';
import 'package:digital_card/database/supabase_config.dart';
import 'package:digital_card/view/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  supabaseConfig();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DigitalCardBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
