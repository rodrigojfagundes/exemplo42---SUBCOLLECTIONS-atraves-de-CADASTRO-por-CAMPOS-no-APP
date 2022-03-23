import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'paginicio.dart';

void main()
//fazendo a inicializacao do FIREBASE...
//dizendo q ele vai ser ASYNC ou seja enquanto nos BUSCAMOS/CONECTAMOS ao FB
//outros WIDGETS/CONTAINERS podem aparecer na tela do celular, mesmo q eles
//tenham sido chamados dps do FB... pd ser q eles aparecam na tela ANTES
//pois temos q se conctar no FB antes de mostrar as infos q tao no FB
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //definindo que a pagina INICIAL vai ser o q ta na CLASSE INICIO
      home: inicio(),
    );
  }
}
