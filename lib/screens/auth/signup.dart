import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/color.dart';

class Signup extends StatefulWidget {
  static const routeName = '/signup';

  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

enum Field { name, email, phone, password, pin }

class _SignupState extends State<Signup> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final securityPinController = TextEditingController();
  var obscure = true;

  toggleObscure() {
    setState(() {
      obscure != obscure;
    });
  }

  Widget kTextField(
      TextEditingController controller, Field field, String label) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          switch (field) {
            case Field.name:
              if (value.length < 3) return 'Invalid fullname';
              break;
            case Field.email:
              if (value.contains('@') && value.length < 11) {
                return null;
              } else {
                return 'Email is invalid';
              }
            case Field.pin:
              if (value.length < 4) return 'Pin should be four number';
              break;

            case Field.password:
              if (value.length < 8) return 'Password is not strong';
          }
          return '$field must be approved!';
        }

        return null;
      },
      controller: controller,
      obscureText: field == Field.password ? true : false,
      keyboardType: field == Field.email
          ? TextInputType.emailAddress
          : field == Field.phone
              ? TextInputType.phone
              : field == Field.pin
                  ? TextInputType.number
                  : TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: field == Field.password
            ? obscure
                ? GestureDetector(
                    onTap: () => toggleObscure,
                    child: const Icon(
                      Icons.visibility_outlined,
                    ),
                  )
                : GestureDetector(
                    onTap: () => toggleObscure,
                    child: const Icon(
                      Icons.visibility_off_outlined,
                    ),
                  )
            : const Text(''),
        label: Text(label),
        labelStyle: const TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1,
            color: greyShade2,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome,',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              'Create your account to get started',
              style: TextStyle(color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
