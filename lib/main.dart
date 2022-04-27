import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // o const otimiza o cótigo em tempo de compilação.
}

class MyApp extends StatelessWidget {
  // responsável por todas as configurações do app
  // widget personalizado
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // o build vem da classe StatelessWidget
    // função que retorna um widget, se chama build e recebe um build context.
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  void decrement() {
    setState(() => {counter--});
  }

  void increment() {
    setState(() => {counter++});
  }

  bool get isEmpty => counter == 0;

  bool get isFull => counter == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pizza.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // eixo principal da coluna
          children: [
            Text(
              isFull ? 'Lotado!' : 'Pode entrar!',
              style: TextStyle(
                fontSize: 30,
                color: isFull ? Colors.red : Color.fromARGB(255, 255, 255, 255),
                fontWeight: isFull ? FontWeight.w900 : FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(60),
              child: Text(
                '$counter',
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty
                      ? null
                      : decrement, // se tiver vazio não decrementa.
                  style: TextButton.styleFrom(
                    // mesmo nome do botão.styleFrom()
                    backgroundColor: isEmpty
                        ? Colors.white.withOpacity(.2)
                        : Colors.white, // Com opacidade no botão
                    fixedSize: const Size(100, 100), // w and h
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ), // widget invisivel para dar um espaçamento entre os boões
                TextButton(
                  onPressed: isFull
                      ? null
                      : increment, // se tiver lotado não incrementa
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ), // body da tela
    );
  }
}
