// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:digital_card/bloc/digital_card_bloc.dart';
import 'package:digital_card/bloc/digital_card_event.dart';
import 'package:digital_card/bloc/digital_card_state.dart';
import 'package:digital_card/utils/custom_widgets/buttom_widget.dart';
import 'package:digital_card/utils/custom_widgets/text_field_widget.dart';
import 'package:digital_card/utils/custom_widgets/text_widget.dart';
import 'package:digital_card/utils/extension/layout.dart';
import 'package:digital_card/utils/extension/navigator.dart';
import 'package:digital_card/utils/extension/screen_resposive.dart';
import 'package:digital_card/view/digital_card_view/digital_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: context.heightFullScreen(),
          width: context.widthFullScreen(),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 159, 200, 222),
              Color.fromARGB(255, 171, 141, 220)
            ], begin: Alignment.topRight, end: Alignment.bottomRight),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 40,right: 20,),
              child: Column(
                children: [
                  Image.asset('assets/tuwaiq_academy_logo.png'),
                  height40,
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Welcome to Tuwaiq Academy',
                        colorText: Colors.white,
                        fontSizeText: 30,
                        fontWeightText: FontWeight.w300,
                      ),
                      TextWidget(
                        text: 'Login , ',
                        colorText: Colors.white,
                        fontSizeText: 40,
                        fontWeightText: FontWeight.w300,
                      ),
                      TextWidget(
                        text: 'to see your digital card',
                        colorText: Colors.white,
                        fontSizeText: 20,
                        fontWeightText: FontWeight.w300,
                      ),
                    ],
                  ),
                  height40,
                  TextFieldWidget(
                    controller: emailController,
                    labelString: 'Email',
                    icon: Icons.email,
                  ),
                  height20,
                  TextFieldWidget(
                    controller: passwordController,
                    labelString: 'Password',
                    icon: Icons.password_rounded,
                  ),
                  height20,
                  BlocConsumer<DigitalCardBloc, DigitalCardState>(
                      listener: (context, state) {
                    if (state is UpdateDigitalCardInfoState) {
                      context.pushAndRemoveUntil(page: const DigitalCardView());
                    } else if (state is ErrorStateBloc) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  }, builder: (context, state) {
                    return ButtomWidget(
                      textButtom: 'Login',
                      onPressd: () async {
                        // Future.delayed(const Duration(seconds: 4), () {
                        //   const CircularProgressIndicator();
                        // });
                        context.read<DigitalCardBloc>().add(
                            GetDigitalCardInfoEvent(
                                emailController.text, passwordController.text));
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
