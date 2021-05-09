import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pink[600]),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.pink[600], Colors.deepPurple[600]],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 5.0],
                        ),
                      ),
                      height: 300,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  VistaFoto(),
                  Container(
                    margin: EdgeInsets.only(top: 22, bottom: 25),
                    child: Contenedor(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Contenedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'USER PROFILE',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Contenido(),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 4,
          ),
        ],
      ),
    );
  }
}

class CajaFecha extends StatefulWidget {
  @override
  _CajaFechaState createState() => _CajaFechaState();
}

class _CajaFechaState extends State<CajaFecha> {
  String _fecha = '';
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 6),
              child: Text(
                'Date of Birth',
                style: TextStyle(
                  color: Colors.purple[700],
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              )),
          TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'DD/MM/YYYY',
                prefixIcon: Icono(Icons.date_range),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                _selectDate(context);
              }),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2022),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {});
      _fecha = date.toString();
      _textController.text = _fecha;
    }
  }
}

class Contenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          CajaTexto(
            text: 'Enter User Name',
            label: 'User Name',
            icon: Icons.account_circle_outlined,
          ),
          CajaTexto(
            text: 'Enter Email',
            label: 'Email Id',
            icon: Icons.email_rounded,
            textType: TextInputType.emailAddress,
          ),
          CajaTexto(
            text: 'Enter your 10 digit mobile number',
            label: 'Mobile Number',
            icon: Icons.smartphone,
            textType: TextInputType.phone,
          ),
          CajaFecha(),
          Sexo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [Colors.purple[500], Colors.deepPurple[600]],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 5.0],
                    ),
                  ),
                  child: Text(
                    'SAVE',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Sexo extends StatefulWidget {
  @override
  _SexoState createState() => _SexoState();
}

class _SexoState extends State<Sexo> {
  bool male = false;
  bool female = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sex',
          style: TextStyle(
            color: Colors.purple[700],
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Switch(
              value: male,
              onChanged: (value) {
                print(value);
                setState(() {});
                if (female == true) {
                  female = false;
                  male = true;
                } else {
                  male = value;
                }
              },
              activeColor: Colors.purple,
            ),
            Text('Male'),
            SizedBox(width: 30),
            Switch(
              value: female,
              onChanged: (value) {
                setState(() {});
                if (male == true) {
                  male = false;
                  female = true;
                } else {
                  female = value;
                }
              },
              activeColor: Colors.purple,
            ),
            Text('Female'),
          ],
        ),
      ],
    );
  }
}

class CajaTexto extends StatelessWidget {
  final String label;
  final String text;
  final IconData icon;
  final TextInputType textType;

  const CajaTexto({this.text, this.label, this.icon, this.textType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 5),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.purple[700],
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: text,
              prefixIcon: Icono(icon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            keyboardType: textType,
          ),
        ],
      ),
    );
  }
}

class Icono extends StatelessWidget {
  final IconData i;

  const Icono(
    this.i, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 1, left: 2, right: 5),
      padding: EdgeInsets.all(1),
      child: Icon(i, size: 30, color: Colors.white),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class VistaFoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: 130,
              height: 130,
              margin: EdgeInsets.only(top: 50, bottom: 15),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/1.jpg'),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lacey Fernandez',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(width: 10),
                Container(
                  padding:
                      EdgeInsets.only(left: 7, top: 5, right: 5, bottom: 7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.edit_outlined,
                    color: Colors.blueGrey[200],
                    size: 20,
                  ),
                )
              ],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 40, left: 88),
          padding: EdgeInsets.fromLTRB(8, 6, 6, 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.image_outlined,
            color: Colors.grey[600],
            size: 25,
          ),
        ),
      ],
      alignment: Alignment.topCenter,
    );
  }
}
