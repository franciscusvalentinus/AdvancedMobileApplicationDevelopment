part of 'pages.dart';

class Register extends StatefulWidget {
  static const String routeName = "/register";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isVisible = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(32),
              child: ListView(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Image.asset("assets/images/LogoFinal.png"),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: ctrlName,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                labelText: "Name",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder()),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill the field";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: ctrlPhone,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Phone",
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder()),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill the field";
                              } else {
                                if (value.length < 7 || value.length > 14) {
                                  return "Phone number isn't valid!";
                                } else {
                                  return null;
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: ctrlEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(Icons.mail_outline_rounded),
                                border: OutlineInputBorder()),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill the field";
                              } else {
                                if (!EmailValidator.validate(value)) {
                                  return "Email isn't valid!";
                                } else {
                                  return null;
                                }
                              }
                            },
                          ),
                          SizedBox(height: 24),
                          TextFormField(
                            controller: ctrlPassword,
                            obscureText: isVisible,
                            decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.vpn_key),
                                border: OutlineInputBorder(),
                                suffixIcon: new GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                  child: Icon(isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              return value.length < 6
                                  ? "Password must have at least 6 characters!"
                                  : null;
                            },
                          ),
                          SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                //melanjutkan ke tahap berikutnya
                                setState(() {
                                  isLoading = true;
                                });
                                Users users = new Users(
                                    "",
                                    ctrlName.text,
                                    ctrlPhone.text,
                                    ctrlEmail.text,
                                    ctrlPassword.text,
                                    "",
                                    "");
                                String msg = await AuthServices.signUp(users);
                                // await AuthServices.signUp(users).then((value) {
                                if (msg == "success") {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ActivityServices.showToast(
                                      "Register Success", Colors.green);
                                  Navigator.pushNamed(context, Login.routeName);
                                } else {
                                  ActivityServices.showToast(msg, Colors.red);
                                  // Navigator.pushNamed(context, Login.routeName);
                                }
                                // });
                              } else {
                                //kosongkan aja
                                Fluttertoast.showToast(
                                    msg: "Please check the fields!",
                                    backgroundColor: Colors.red);
                              }
                            },
                            icon: Icon(Icons.save),
                            label: Text("Register"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrange[400], elevation: 4),
                          ),
                          SizedBox(height: 24),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, Login.routeName);
                            },
                            child: Text(
                              "Already registered? Login.",
                              style: TextStyle(
                                color: Colors.deepOrange[400],
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ),
      ),
    );
  }
}
