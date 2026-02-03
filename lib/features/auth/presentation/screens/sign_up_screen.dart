import 'package:blog_clean_architecture/core/extension/context_size_box_extension.dart';
import 'package:blog_clean_architecture/features/auth/presentation/screens/login_screen.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_button.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_pallete.dart';
import '../provider/sign_up_provider.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error!)));
      }
    });
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: .all(10),
          child: Center(
            child: SingleChildScrollView(
              physics: ScrollPhysics(parent: BouncingScrollPhysics()),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    Text(
                      'Sign up',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppPallete.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    context.vSpace(5),
                    AuthField(hintText: 'Name', controller: _nameController),
                    AuthField(hintText: 'Email', controller: _emailController),
                    AuthField(
                      hintText: 'Password',
                      controller: _passwordController,
                      isObscure: true,
                    ),
                    context.vSpace(5),
                    Consumer(
                      builder: (context, ref, child) {
                        final state = ref.watch(authProvider);
                        final stateNotifier = ref.read(authProvider.notifier);
                        return AuthButton(
                          isLoading: state.isLoading,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              stateNotifier.signUp(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                            }
                          },
                          title: 'Sign up',
                        );
                      },
                    ),
                    context.vSpace(5),
                    AuthText(
                      text: 'Already have an account? ',
                      buttonText: 'Log in',
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
