import 'package:flutter/material.dart';
import 'form_widget.dart';
import 'top_stack.dart';

void main() {
  runApp(const FormsApp());
}

class FormsApp extends StatelessWidget {
  const FormsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forms App',
      theme: themeDataMethod(),
      home: const FormsHomePage(title: 'Forms App'),
    );
  }
}

class FormsHomePage extends StatefulWidget {
  const FormsHomePage({super.key, required this.title});

  final String title;

  @override
  State<FormsHomePage> createState() => _FormsHomePageState();
}

class _FormsHomePageState extends State<FormsHomePage> {
  final formGlobalKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              TopStack(widget: widget),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormWidget(
                  formKey: formGlobalKey,
                  emailSetter: (email) {
                    setState(() {
                      this.email = email;
                    });
                  },
                  passwordSetter: (password) {
                    setState(() {
                      this.password = password;
                    });
                  }),
              Text(email),
              Text(password),
            ],
          ),
        ),
      ),
    );
  }
}

ThemeData themeDataMethod() {
  return ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.deepPurple,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.deepPurple,
        ),
        borderRadius: BorderRadius.circular(120),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.redAccent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 12, 54, 88),
        ),
        borderRadius: BorderRadius.circular(120),
      ),
      contentPadding: const EdgeInsets.all(22.0),
      prefixIconColor: Colors.deepPurple,
      suffixIconColor: const Color.fromARGB(255, 124, 72, 212),
    ),
  );
}
