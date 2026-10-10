import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/routes/routes.dart';
import 'package:shopping/core/utils/progress_dialog.dart';
import 'package:shopping/core/widgets/Buttons/primary_btn.dart';
import 'package:shopping/core/widgets/text_filed.dart';
import 'package:shopping/features/auth/domain/entities/auth_register_entity.dart';
import 'package:shopping/features/auth/presentation/view_model/Register_cubit/register_cubit.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: "ziadhosny");
    password = TextEditingController(text: "@ziadZIAD2007");
    email = TextEditingController(text: "ziadhosny740@gmail.com");
    confirmPassword = TextEditingController(text: "@ziadZIAD2007");
    phone = TextEditingController(text: "01144287640");
  }

  @override
  void dispose() {
    name.dispose();
    password.dispose();
    phone.dispose();
    email.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final auth=AuthRegisterEntity();
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: SingleChildScrollView(
          child: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoading) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => ProgressDialog(),
                );
              }
              if (state is RegisterSuccess) {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.login);
              }
              if (state is RegisterError) {
                Navigator.of(context).pop();

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: Column(
              spacing: 8,
              mainAxisAlignment: .start,
              crossAxisAlignment: .center,
              children: [
                SizedBox(
                  width: 350,

                  child: Text(
                    "Full Name",
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                    textAlign: .start,
                  ),
                ),
                TextFiledStyle(hint: "youusef mohmed", isSecure: false),
                SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  child: Text(
                    "Email",
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                    textAlign: .start,
                  ),
                ),
                TextFiledStyle(
                  hint: "youusefmhmd30@gmail.coom",
                  isSecure: false,
                ),

                SizedBox(height: 20),
                SizedBox(
                  width: 350,

                  child: Text(
                    "Phone",
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                    textAlign: .start,
                  ),
                ),
                TextFiledStyle(hint: "+2012342675787", isSecure: false),
                SizedBox(height: 20),
                SizedBox(
                  width: 350,

                  child: Text(
                    "Password",
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                    textAlign: .start,
                  ),
                ),
                TextFiledStyle(hint: "* * * * * * * *", isSecure: true),
                SizedBox(height: 20),
                SizedBox(
                  width: 350,

                  child: Text(
                    "Confirm Password",
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                    textAlign: .start,
                  ),
                ),
                TextFiledStyle(hint: "* * * * * * * *", isSecure: true),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 30),
                  child: Center(
                    child: PrimaryBtn(
                      text: "Sign Up",
                      onPressed: () {
                        final AuthRegisterEntity request = AuthRegisterEntity(
                          confirmPassword: confirmPassword.text,
                          password: password.text,
                          email: email.text,
                          name: name.text,
                          phone: phone.text,
                        );
                        context.read<RegisterCubit>().intent(
                          RegisterWithEmaiAndPassword(request),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.login);
            },
            child: Row(
              mainAxisAlignment: .center,
              children: [
                Text("Already have an account? "),
                Text(
                  "Login",
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
