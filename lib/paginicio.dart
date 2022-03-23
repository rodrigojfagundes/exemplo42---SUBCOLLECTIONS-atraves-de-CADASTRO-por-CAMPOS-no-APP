import 'firebase.dart';
import 'package:flutter/material.dart';

class inicio extends StatefulWidget {
  const inicio({Key? key}) : super(key: key);

  @override
  _inicioState createState() => _inicioState();
}

class _inicioState extends State<inicio> {
//variaveis do tipo TextEditingControler... Pois nela iram receber os valores q
//vamos digitar nos campos a baixo... variaveis collection1, doc1, collection2, numefuncionario
  TextEditingController collection1 = TextEditingController();
  TextEditingController doc1 = TextEditingController();
  TextEditingController collection2 = TextEditingController();
  TextEditingController nomefuncionario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //esqueleto do APP
    return Scaffold(
        //single child scroll view serve para dizer q se tiver MTOS CONTAINERS, BUTTON, etc...
        //na mesma tela nos vamos poder rolar a tela para baixo e para cima...
        body: SingleChildScrollView(
      //FORM eu ACHO Q e por nos vamos criar um formulario... para preencher as
      //informacoes
      child: Form(
        //os FORM/FORMULARIOS vao ficar em forma de COLUNA... ou seja na VERTICAL
        //um em baixo do outro
        child: Column(
          //criando a LISTA de coisas q vao aparecer na COLUMN
          children: [
            //o primeiro item da lista é um TEXT FORM FIELD...
            //ou seja um CAMPO para ADD um texto...
            TextFormField(
              //dizendo q o tipo de TECLADO q iremos utilizar nos campos é
              //do tipo TEXTUAL
              keyboardType: TextInputType.text,
              //decoration é uma DECORAÇÂO/DESIGN... dessa forma estamos
              //add um texto INSIRA ALGO COMO RH esse texto fica em CIMA do CAMPO
              //q iremos preencher
              decoration: InputDecoration(labelText: "insira algo como RH"),
              //dizendo q o texto digitado no campo vai ficar centralizado
              textAlign: TextAlign.center,
              //o TEXTO digitado vai ficar salvo na VARIAVEL COLLECTION1
              controller: collection1,
            ),
            //outro campo para ADD texto
            TextFormField(
              //dizendo q o teclado para ADD o texto no campo na tela do APP
              //vai ser um teclado do tipo TEXT/TEXTUAL
              keyboardType: TextInputType.text,
              //decoration é uma DECORAÇÂO/DESIGN... dessa forma estamos
              //add um texto INSIRA UM SETOR TIPO TI esse texto fica em CIMA do CAMPO
              //q iremos preencher
              decoration: InputDecoration(labelText: "insira um setor tipo TI"),
              //dizendo q os valores digitados vao ficar centralizados no campo
              textAlign: TextAlign.center,
              //o valor digitado no campo acima vai ficar armazenado na variavel
              //DOC1
              controller: doc1,
            ),
            //campo/formulario para ADD texto
            TextFormField(
              //o teclado q ira aparecer sera um teclado do tipo TEXTUAL
              keyboardType: TextInputType.text,
              //decoration é uma DECORAÇÂO/DESIGN... dessa forma estamos
              //add um texto INSIRA ALGO COMO FUNCIONARIOS esse texto fica em CIMA do CAMPO
              //q iremos preencher
              decoration:
                  InputDecoration(labelText: "escreva algo como FUNCIONARIOS"),
              //o texto q digitaremos ficara centralizado no campo
              textAlign: TextAlign.center,
              //o texto digitado sera armazenado na variavel COLLECTION2
              controller: collection2,
            ),
            //campo para digitar texto
            TextFormField(
              //o teclado q ira aparecer sera um teclado do tipo TEXTO
              keyboardType: TextInputType.text,
              //decoration é uma DECORAÇÂO/DESIGN... dessa forma estamos
              //add um texto INSIRA ALGO COMO FUNCIONARIOS esse texto fica em CIMA do CAMPO
              //q iremos preencher
              decoration:
                  InputDecoration(labelText: "insira o nome do funcionario"),
              //o texto q sera digitado ficara centralizado
              textAlign: TextAlign.center,
              //os valores digitados no campo acima
              //serao armazenados na variavel NOMEFUNCIONARIO
              controller: nomefuncionario,
            ),
            //campo para detectar toque
            GestureDetector(
              //se for dado um CLICK/TOQUE
              onTap: () {
                //chamaremos a classe FB e para essa classe vamos passar o valor q esta
                //armazenado nas variveis COLLECTION1, DOC1, COLLECTION2 e NOMEFUNCIONARIO

                fb(collection1.text, doc1.text, collection2.text,
                        nomefuncionario.text)
                    //chamamos tbm o METODO/FUNCAO ADDCADASTRO,
                    //q esta dentro da classe FB... esse METODO/CLASSE é o responsavel
                    //por pegar o q ta na variavel NOMEFUNCIONARIO e add
                    //a um DOC no FB
                    .addCadastro(nomefuncionario.text);
              },
              //ao clicarmos no container a baixo nos vamos executar o q ta no
              //GESTURE DETECTOR ACIMA...
              child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  child: Text('cadastrar')),
            )
          ],
        ),
      ),
    ));
  }
}
