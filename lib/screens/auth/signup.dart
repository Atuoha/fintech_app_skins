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
  final formKey = GlobalKey<FormState>();
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

  // textfield for all inputs
  Widget kTextField(TextEditingController controller, Field field, String label,
      String hint) {
    return TextFormField(
      textInputAction:
          field == Field.pin ? TextInputAction.done : TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          switch (field) {
            case Field.name:
              if (value.length < 3) return 'Invalid fullname';
              break;
            case Field.email:
              if (!value.contains('@')) return 'Email is invalid';
              break;
            case Field.pin:
              if (value.length < 4) return 'Pin should be four number';
              break;

            case Field.password:
              if (value.length < 8) return 'Password is not strong';
              break;
            case Field.phone:
              if (value.length < 10) return 'Invalid phone number';
              break;
          }
          return '$field must be approved!';
        }

        return null;
      },
      // maxLength: field == Field.pin ?4:40,
      controller: controller,

      obscureText: field == Field.password ? obscure : false,
      keyboardType: field == Field.email
          ? TextInputType.emailAddress
          : field == Field.phone
              ? TextInputType.phone
              : field == Field.pin
                  ? TextInputType.number
                  : TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: field == Field.password
            ? passwordController.text.isNotEmpty
                ? IconButton(
                    onPressed: () => setState(() {
                      obscure = !obscure;
                    }),
                    icon: Icon(
                      obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  )
                : const Text('')
            : const Text(''),
        hintText: hint,
        label: Text(label),
        labelStyle: const TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w200,
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1,
            color: greyShade1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: primaryColor,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    passwordController.addListener(() {
      setState(() {});
    });
    super.initState();
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome,',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const Text(
                'Create your account to get started',
                style: TextStyle(color: primaryColor),
              ),
              const SizedBox(height: 20),
              kTextField(
                  fullNameController, Field.name, 'FullName', 'Ujunwa Peace'),
              const SizedBox(height: 20),
              kTextField(emailController, Field.email, 'Email Address',
                  'ujunwa001@gmail.com'),
              const SizedBox(height: 20),
              kTextField(
                  phoneNumberController, Field.phone, 'Phone', '23480000000'),
              const SizedBox(height: 20),
              kTextField(
                  passwordController, Field.password, 'Password', '********'),
              const SizedBox(height: 20),
              kTextField(securityPinController, Field.pin,
                  'Security Pin (4 digits)', '0000'),
            ],
          ),
        ),
      ),
    );
  }
}
