//OBS: O Q ESTA NA VARIAVEL COLLECTION1 NAO ESTA SENDO PASSADO PARA A COLLECTION NO FIREBASE
//ACREDITO Q SEJA PQ NO: CollectionReference cadastro =
//      FirebaseFirestore.instance.collection('cadastro'); NAO PD SER COLOCADO VARIAVEIS
//AO MENOS APARENTEMENTE...
//
//

// ignore_for_file: unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';

//criando a classe FB
class fb {
//criando 4 variaveis... Essas variaveis vao receber os valores q sao passados na classe
//INICIO...
//
// e o valor q for passado para a variavel COLLECTION1 vai servir para ser o nome
//da nossa COLLECTION no FB
  final String collection1;
// O valor da variavel DOC1 vai servir para ser o valor do primeiro
//DOC do FIREBASE... O valor da variavel
  final String doc1;
//o valor q for passado para a variavel COLLECTION2 vai servir para ser o valor da segunda
//COLLECTION do FB/FIREBASE
  final String collection2;
//o nome q for passado para a variavel NOMEFUNCIONARIO vai servir de VALOR para a nossa
// CHAVE:VALOR q sera colocado no Firebase... ou seja CHAVE = NOME... e VALOR = o q ta
//na variavel NOMEFUNCIONARIO
  final String nomefuncionario;

//associando as variaveis acima a classe FB
  fb(this.collection1, this.doc1, this.collection2, this.nomefuncionario);

//fazendo uma CollectionReference... Ou seja REFERENCIA a COLLECAO... desta forma ao digitarmos
//CADASTRO, esta dizendo q estamos se conectando ao FB e criando uma COLLECTION com nome
//('cadastro') obs: ('cadastro') poderia ser outro nome...
  CollectionReference cadastro =
      FirebaseFirestore.instance.collection('cadastro');
//
//
//criando o metodo/funcao addCadastro
  //esse metodo/funcao vai receber o valor q passamos ali em cima para variavel NOMEFUNCIONARIO
  //e de forma assincrona vai chamar(return) a Collection Reference CADASTRO
  Future<void> addCadastro(String nomefuncionario) async {
    //atraves do RETURN estamos chamando a COLLECTION REFERENCE criada ali em cima a CADASTRO
    //o AWAIT diz para o android q a funcao a baixo vai demorar um pouquinho para ter retorno
    return await cadastro
        //por algum motivo eu to passando q o valor q vai ta no PRIMEIRO DOC no FB q é COLLECTION1
        //sim, ficou estranho, mas... deveria ser DOC1 para o primeiro DOC, mas... isso aconteceu
        //pq o COLLECTION verdadeiro eu passei na linha 38... no collection reference, ali eu
        //passei 'cadastro' manualmente... entao para usar a variavel collection1 eu associei
        //ela ao DOC a baixo, mas nao funcionou... por algum motivo...
        .doc(collection1)
        //a sintaxe .SET serve para dizer q vamos alterar algo... entao estamos dizendo q
        //vamos alterar/atualizar o q ta na COLLECTION REFERENCE CADASTRO
        .set(
          cadastro
              //estamos criando um novo DOC, e o nome do doc vai ser o q ta na variavel DOC1
              .doc(doc1)
              //estamos criando uma collection e o nome vai ser o q ta na variavel COLLECTION2
              .collection(collection2)
              //na COLLECTION acima, nos vamos criar um DOC com um ID/NOME ALEARTORIO
              //isso acontece pois nao declaramos um NOME/ID para o DOC, entao ele e criado
              //com NOME/ID aleartorio... e entao ADD uma CHAVE chamada de NOME
              //e para ela associamos o VALOR que é o NOME q esta armazenado em NOMEFUNCIONARIO
              .add({'nome': nomefuncionario}),
        )
        //caso ocorra bem, exibe a mensagem cadastro ok
        .then((value) => print('cadastro ok'))
        //caso nao funcione exibe a mensagem a baixo
        .catchError((error) => print('falha cadastro $error'));
  }
}
