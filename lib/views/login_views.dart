import 'package:projek/views/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';

class LoginViews extends StatelessWidget {
  const LoginViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [_JudulFormLogin(), _LogoAplikasi(), _FormLogin()],
        ),
      ),
    );
  }
}

class _FormLogin extends StatelessWidget {
  const _FormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Color.fromARGB(167, 40, 255, 126),
      margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
              label: 'Username',
            ),
            InputField(
              label: 'Password',
            ),
            _TombolLogin()
          ],
        ),
      ),
    );
  }
}

class _TombolLogin extends StatelessWidget {
  const _TombolLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 244, 108, 54),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (c) => DashboardView()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Login'),
          )),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final bool obscure;
  const InputField({super.key, this.label = '', this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(10, 12, 10, 12)),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _LogoAplikasi extends StatelessWidget {
  const _LogoAplikasi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Image.asset(
        'assets/sawi.png',
        width: 120,
      ),
    );
  }
}

class _JudulFormLogin extends StatelessWidget {
  const _JudulFormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Text('APLIKASI DETEKSI \nHAMA TANAMAN SAWI',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center),
    ));
  }
}
