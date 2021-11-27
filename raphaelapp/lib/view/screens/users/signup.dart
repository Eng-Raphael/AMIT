import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import './../../../others/all.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _cont = Get.put(CredentialController());
  final _bloc = LoadingBloc();

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
                controller: _cont.rname,
                size: size,
                title: nameconst,
                icon: Icons.person,
              ),
              TextfeildIcon(
                controller: _cont.remail,
                size: size,
                title: emailconst,
                icon: Icons.email_outlined,
              ),
              TextfeildIcon(
                controller: _cont.rpassword,
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
                      title: signupconst,
                      size: size,
                      custbutfunc: () {
                        _bloc.loadingsink.add(true);
                        _cont.registerget(
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
                title: "Go $loginconst !",
                txtfunc: () {
                  CustMeth().replash(context, const LoginScreen());
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
