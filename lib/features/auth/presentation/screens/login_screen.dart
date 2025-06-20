import 'package:auvnet_internship_assessment/features/auth/presentation/screens/widget/auth_input_decoration.dart';
import 'package:auvnet_internship_assessment/features/auth/presentation/screens/widget/input_container.dart';
import 'package:auvnet_internship_assessment/features/home_page/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/assets_manager.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widget/dialog_until.dart';
import '../../../../core/widget/validators.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/login_bloc/login_event.dart';
import '../bloc/login_bloc/login_state.dart';


class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'salma@gmail.com');
  final passwordController = TextEditingController(text: 'salma111');

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset(
                      ImageAssets.logoSplash,
                      width: screenWidth * 0.7,
                      height: screenWidth * 0.7,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                      vertical: screenHeight * 0.025,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            AppStrings.login,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: screenHeight * 0.035,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          InputContainer(
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: AppValidators.validateEmail,
                              decoration: authInputDecoration(context,AppStrings.Email),
                              style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          InputContainer(
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              validator: AppValidators.validatePassword,
                              decoration: authInputDecoration(context,AppStrings.password),
                              style: TextStyle(fontSize: 16, color: Color(0xFF1F2937)),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          BlocConsumer<LoginBloc, LoginState>(
                            listener: (context, state) {
                              if (state is LoginLoading) {
                                DialogUtils.showLoading(context: context, message: AppStrings.wait);

                              } else if (state is LoginSuccess) {
                                DialogUtils.hideLoading(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomeScreen()),
                                );
                              } else if (state is LoginFailure) {
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
                                height: screenHeight * 0.065,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<LoginBloc>().add(
                                        LoginSubmitted(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: AppColors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    AppStrings.login,
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.022,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pushNamed(Routes.signUpRoute),
                            child: Text(
                              AppStrings.createAccount,
                              style: TextStyle(
                                fontSize: screenHeight * 0.021,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
