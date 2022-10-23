part of 'pages.dart';

class SendMail extends StatefulWidget {
  const SendMail({super.key});

  @override
  State<SendMail> createState() => _SendMailState();
}

class _SendMailState extends State<SendMail> {
  final _MailKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();

  @override
  void dispose() {
    ctrlEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mail to", style: TextStyle(color: Colors.black)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.yellow, Colors.purple])),
        ),
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Form(
          key: _MailKey,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(8),
            ),
            controller: ctrlEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return !EmailValidator.validate(value.toString())
                  ? 'Email tidak valid!'
                  : null;
            },
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_MailKey.currentState!.validate()) {
            await MailService()
                .SendMail(ctrlEmail.text.toString())
                .then((value) {
              var result = json.decode(value.body);
              print(result.toString());
            });
          }
        },
        label: Text("Send"),
        icon: Icon(Icons.send),
        backgroundColor: Color.fromARGB(255, 9, 87, 151),
      ),
    );
  }
}
