import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/routes/routes.dart';
import 'package:shopping/core/utils/massege_error.dart';
import 'package:shopping/core/utils/progress_dialog.dart';
import 'package:shopping/core/widgets/Buttons/primary_btn.dart';
import 'package:shopping/core/widgets/text_filed.dart';
import 'package:shopping/features/auth/domain/entities/auth_login_requst_entity.dart';
import 'package:shopping/features/auth/presentation/view_model/Login_cubit/login_cubit.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController email;
  late TextEditingController password;
  @override
  void initState() {
    super.initState();
    password = TextEditingController(text: "@ziadZIAD2007");
    email = TextEditingController(text: "ziadhosny740@gmail.com");
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: SingleChildScrollView(
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => ProgressDialog(),
                );
              }
              if (state is LoginSuccess) {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(Routes.appSection);
              }
              if (state is LoginError) {
                Navigator.of(context).pop();

                      MassegeError.show(context, error: state.message);

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
                    "Email",
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                    textAlign: .start,
                  ),
                ),
                TextFiledStyle(
                  hint: "youusefmhmd30@gmail.coom",
                  isSecure: false,
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: 350,
                  child: Text(
                    "Password",
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                    textAlign: .start,
                  ),
                ),
                TextFiledStyle(hint: "* * * * * * * *", isSecure: true),
                Container(
                  alignment: .centerRight,
                  child: SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: .end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forget Password?",
                            style: Theme.of(context).primaryTextTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: PrimaryBtn(
                      text: "Login",
                      onPressed: () {
                        final AuthLoginRequstEntity response =
                            AuthLoginRequstEntity(
                              email: email.text,
                              password: password.text,
                            );
                        context.read<LoginCubit>().intent(
                          LoginWithEmaiAndPassword(response),
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
          padding: const EdgeInsets.only(bottom: 36),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.register);
            },
            child: Row(
              mainAxisAlignment: .center,
              children: [
                Text("Don’t have an account? "),
                Text(
                  "Sign Up",
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
