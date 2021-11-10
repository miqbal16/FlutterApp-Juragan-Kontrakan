import 'package:flutter/material.dart';
import 'package:juragan_kontrak/pages/main_page.dart';
import 'package:juragan_kontrak/pages/register_page.dart';
import 'package:juragan_kontrak/themes/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailInput = TextEditingController();
  final TextEditingController _passwordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LOGIN',
                    style: titleTextStyle1.copyWith(
                      fontWeight: semibold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    'Sign In untuk Melanjutkan',
                    style: subTitleTextStyle3,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email Address',
                    style: titleTextStyle3.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.mail,
                          color: Colors.deepOrange,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _emailInput,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Your Email Address'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: titleTextStyle3.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.lock,
                          color: Colors.deepOrange,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _passwordInput,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Your Password',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 30,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const MainPage();
                    }),
                  );
                },
                child: Text(
                  'Sign In',
                  style: titleTextStyle3.copyWith(
                    fontWeight: medium,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum mempunyai akun? ',
                    style: subTitleTextStyle3.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const RegisterPage();
                        }),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: subTitleTextStyle3.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                        color: Colors.deepOrange,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailInput.dispose();
    _passwordInput.dispose();
    super.dispose();
  }
}
