import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "Fatec Ferraz Contador de Alunos",
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Não chegou ninguém ainda!";

  _alteraContador(int i) {
    setState(() {
      _pessoa += i;

      if (_pessoa <= 0) {
        _mensagem = "Não chegou ninguém ainda!";
        _pessoa = 0;
      } else if (_pessoa >= 50) {
        _mensagem = "Lotado! Por favor, aguarde!";
        _pessoa = 50;
      } else {
        _mensagem = "Pode Entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/imagem.jpg",
            fit: BoxFit.cover,
            height: 250,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Pessoas: $_pessoa",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          child: const Center(
                            child: Text(
                              "+1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                          onTap: () {
                            _alteraContador(1);
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                      ),
                      Container(
                        width: 80,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          child: const Center(
                            child: Text(
                              "-1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                          onTap: () {
                            _alteraContador(-1);
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    _mensagem,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
