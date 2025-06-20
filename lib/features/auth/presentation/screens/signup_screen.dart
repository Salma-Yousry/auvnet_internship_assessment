import 'package:auvnet_internship_assessment/features/auth/presentation/screens/widget/auth_input_decoration.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/screens/widget/input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/assets_manager.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widget/dialog_until.dart';
import '../../../../core/widget/validators.dart';
import '../../../home_page/presentation/screens/home_page.dart';
import '../bloc/signup_bloc/signup_bloc.dart';
import '../bloc/signup_bloc/signup_event.dart';
import '../bloc/signup_bloc/signup_state.dart';

class SignupScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Center(
                child: Image.asset(
                  ImageAssets.logoSplash,
                  width: w * 0.7,
                  height: w * 0.7,
                  fit: BoxFit.cover,
                ),
              ),
              // Form
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.06,
                  vertical: h * 0.015,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppStrings.signup,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: h * 0.033,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1F2937),
                        ),
                      ),
                      SizedBox(height: h * 0.03),
                      // Email
                      InputContainer(
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: AppValidators.validateEmail,
                          decoration: authInputDecoration(context, AppStrings.Email),
                          style: const TextStyle(fontSize: 16, color: Color(0xFF1F2937)),
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      // Password
                      InputContainer(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: AppValidators.validatePassword,
                          decoration: authInputDecoration(context, AppStrings.password),
                          style: const TextStyle(fontSize: 16, color: Color(0xFF1F2937)),
                        ),
                      ),
                      SizedBox(height: h * 0.02),

                      InputContainer(
                        child: TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return AppStrings.confirmPasswordRequired;
                            }
                            if (value != passwordController.text) {
                              return AppStrings.passwordsDoNotMatch;
                            }
                            return null;
                          },
                          decoration: authInputDecoration(context, AppStrings.confirmPassword),
                          style: const TextStyle(fontSize: 16, color: Color(0xFF1F2937)),
                        ),
                      ),
                      SizedBox(height: h * 0.03),
                      // Sign‑up Button
                      BlocConsumer<SignupBloc, SignupState>(
                        listener: (context, state) {
                          if (state is SignupLoading) {
                            DialogUtils.showLoading(context: context, message: AppStrings.wait);
                          } else if (state is SignupSuccess) {
                            DialogUtils.hideLoading(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          } else if (state is SignupFailure) {
                            DialogUtils.hideLoading(context);
                            DialogUtils.showMessage(
                              context: context,
                              message: state.error,
                              posActionName: AppStrings.ok,
                            );
                          }
                        },
                        builder: (context, state) {
                          return SizedBox(
                            height: h * 0.065,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<SignupBloc>().add(
                                    SignupRequested(
                                      emailController.text,
                                      passwordController.text,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF8B5CF6),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                AppStrings.signup,
                                style: TextStyle(
                                  fontSize: h * 0.022,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: h * 0.02),
                      TextButton(
                        onPressed: () => Navigator.of(context).pushNamed(Routes.signInRoute),
                        child: Text(
                          AppStrings.logInAnAccount,
                          style: TextStyle(
                            fontSize: h * 0.021,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF8B5CF6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
