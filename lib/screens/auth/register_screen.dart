import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),

              // Заголовок
              const Text(
                'MeTrack',


                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Cледить за своими привычками',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 32),

              // Email
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // Пароль
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // Подтверждение пароля
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Подтвердите пароль',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 32),

              // Кнопка регистрации
              ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  child: const Text('Зарегистрироваться'),
),


              const SizedBox(height: 16),

              // Переход к входу
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Уже есть аккаунт?'),
                  TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  },
  child: const Text('Войти'),
),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
