import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import './../../../others/all.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _bloc = LoadingBloc();
  final _cont = Get.put(CredentialController());

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: screenback,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: screenback,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
        ),
        preferredSize: const Size.fromHeight(0),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Imagewid(size: size),
              const SizedBox(height: 40),
              TextfeildIcon(
                controller: _cont.lemail,
                size: size,
                title: emailconst,
                icon: Icons.email_outlined,
              ),
              TextfeildIcon(
                controller: _cont.lpassword,
                size: size,
                title: passwordconst,
                icon: Icons.lock_outline,
              ),
              const SizedBox(height: 40),
              StreamBuilder<bool>(
                initialData: false,
                stream: _bloc.loadingstream,
                builder: (context, snapshot) {
                  if (snapshot.data!) {
                    return const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(color: prim),
                    );
                  } else {
                    return Custbutton(
                      title: loginconst,
                      size: size,
                      custbutfunc: () {
                        _bloc.loadingsink.add(true);
                        _cont.loginget(
                          () {
                            _bloc.loadingsink.add(false);
                            CustMeth().replash(context, const BottomBar());
                          },
                          () {
                            _bloc.loadingsink.add(false);
                          },
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 40),
              Customtxtbut(
                size: size,
                title: "Go $signupconst !",
                txtfunc: () {
                  CustMeth().replash(context, const SignupScreen());
                },
                align: Alignment.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
