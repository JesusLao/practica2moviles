import 'package:flutter/material.dart';
import 'package:practica2moviles/accounts/account.dart';
import 'package:practica2moviles/accounts/accountService.dart';
import 'package:practica2moviles/word/wordService.dart';
import 'dart:math';
import '../word/word.dart';
import '../widgets/wordTile.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GameScreen extends StatefulWidget {
  final Account accountLogged;
  const GameScreen({Key? key, required this.accountLogged}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Word currentWord = Word(word: '', desc: '');
  TextEditingController wordInputController = TextEditingController();
  String feedbackMessage = '';
  List<Word> wordList = [];
  int trys = 0;

  @override
  void initState() {
    super.initState();
    _getRefreshWords();
  }

  void _getRefreshWords() async {
    final data = await WordService1.loadWords();
    setState(() {
      wordList = data;
      startNewGame();
    });
  }

  void startNewGame() {
    // WordService1.insertWord(Word(
    //     word: "ñapa",
    //     desc: "Añadidura, especialmente la que se da como propina o regalo."));
    // WordService1.insertWord(Word(
    //     word: "somormujo",
    //     desc:
    //         "Ave palmípeda, con pico recto y agudo, alas cortas, patas vestidas, plumas del lomo, cabeza y cuello negras, pecho y abdomen blancos, costados castaños, y un pincel de plumas detrás de cada ojo, que vuela poco y puede mantener por mucho tiempo la cabeza sumergida bajo el agua.",
    //     image:
    //         "https://upload.wikimedia.org/wikipedia/commons/2/27/Podiceps_cristatus_2_-_Lake_Dulverton.jpg"));
    // WordService1.insertWord(Word(
    //     word: "zafio",
    //     desc:
    //         "Dicho de una persona: Grosera o tosca en sus modales, o carente de tacto en su comportamiento"));
    // WordService1.insertWord(
    //     Word(word: "inefable", desc: "Que no se puede explicar con palabras."));
    // WordService1.insertWord(
    //     Word(word: "ofuscar", desc: "Deslumbrar, turbar la vista."));
    // WordService1.insertWord(Word(word: "baladí", desc: "De poca importancia."));
    // WordService1.insertWord(
    //     Word(word: "ubérrimo", desc: "Muy abundante y fértil."));
    // WordService1.insertWord(Word(word: "culamen", desc: "Culo (nalgas)."));
    // WordService1.insertWord(Word(word: "papahuevos", desc: "Papanatas."));
    // WordService1.insertWord(Word(
    //     word: "papichulo",
    //     desc: "Hombre que, por su atractivo físico, es objeto de deseo."));
    // WordService1.insertWord(Word(
    //     word: "uebos", desc: "Necesidad, cosa necesaria. Ej: Uebos me es."));
    // WordService1.insertWord(
    //     Word(word: "jipiar", desc: "Hipar, gemir, gimotear."));
    // WordService1.insertWord(Word(
    //     word: "amigovio",
    //     desc:
    //         "Persona que mantiene con otra una relación de menor compromiso formal que un noviazgo."));
    // WordService1.insertWord(Word(
    //     word: "coprolito",
    //     desc: "Excremento fósil.",
    //     image:
    //         "https://uvn-brightspot.s3.amazonaws.com/assets/vixes/btg/curiosidades.batanga.com/files/Coprolitos-informacion-en-heces-fosiles-1.jpg"));
    // WordService1.insertWord(
    //     Word(word: "abuhado", desc: "Hinchado o abotagado."));
    // WordService1.insertWord(Word(
    //     word: "ayeaye",
    //     desc:
    //         "Prosimio del tamaño de un gato, con hocico agudo, la cola más larga que el cuerpo y muy poblada, los dedos muy largos y delgados y con uñas corvas y puntiagudas, excepto los pulgares de las extremidades posteriores que las tienen planas.",
    //     image:
    //         "https://allyouneedisbiology.files.wordpress.com/2017/02/aye-aye.jpg?w=1038&h=576&crop=1"));
    // WordService1.insertWord(Word(
    //     word: "narval",
    //     desc:
    //         "Cetáceo de unos seis metros de largo, con cabeza grande, hocico obtuso, boca pequeña, sin más dientes que dos incisivos superiores, uno corto y otro que se prolonga horizontalmente hasta cerca de tres metros; cuerpo robusto, liso, brillante, blanco y con vetas pardas por el lomo, dos aletas pectorales y cola grande y ahorquillada.",
    //     image:
    //         "https://cflvdg.avoz.es/sc/vlLzTsHdBtzCDpJZ_dQ1887w_KU=/1280x/2019/05/02/00121556811865576599386/Foto/narval.jpg"));
    // WordService1.insertWord(Word(
    //     word: "espurio",
    //     desc: "Bastardo (que degenera de su origen o naturaleza)."));
    // WordService1.insertWord(Word(
    //     word: "berbiquí",
    //     desc:
    //         "Manubrio semicircular o en forma de doble codo que sirve para taladrar o hacer agujeros.",
    //     image:
    //         "https://m.media-amazon.com/images/I/71AY1sWkpLL._AC_UF894,1000_QL80_.jpg"));
    // WordService1.insertWord(Word(
    //     word: "galocha",
    //     desc:
    //         "Calzado de madera con refuerzos de hierro, usado en algunas provincias para andar por la nieve, por el lodo o por suelo muy mojado.",
    //     image:
    //         "https://4.bp.blogspot.com/_EKJTC-QOtoo/SXz0_alwLtI/AAAAAAAAHVc/Vf_kQ07f8Rw/s280/calzado+madrena5.jpg"));
    // WordService1.insertWord(Word(
    //     word: "pelerina",
    //     desc: "Toquilla de punto, como capa corta, que usan las mujeres.",
    //     image:
    //         "https://m.media-amazon.com/images/I/4158U1fdgeL._UF894,1000_QL80_.jpg"));
    // WordService1.insertWord(Word(
    //     word: "espolín",
    //     desc:
    //         "Tela de seda con flores esparcidas, como las del brocado de oro o de seda.",
    //     image:
    //         "https://garin1820.com/wp-content/uploads/2019/07/portada-espolin-valencia-1080x675.jpg"));
    // WordService1.insertWord(Word(
    //     word: "viticultor",
    //     desc: "Perteneciente o relativo a la viticultura."));
    // WordService1.insertWord(Word(
    //     word: "zurrapa",
    //     desc:
    //         "Brizna, pelillo o sedimento que se halla en los líquidos y que poco a poco se va sentando."));
    // WordService1.insertWord(Word(
    //     word: "quincalla",
    //     desc:
    //         "Conjunto de objetos de metal, generalmente de escaso valor, como tijeras, dedales, imitaciones de joyas."));
    // WordService1.insertWord(Word(
    //     word: "pipeta",
    //     desc:
    //         "Tubo de cristal ensanchado en su parte media, que sirve para trasladar pequeñas porciones de líquido de un vaso a otro.",
    //     image:
    //         "https://esp.labbox.com/wp-content/uploads/sites/2/2020/07/MPI2-010-005.jpg"));
    // WordService1.insertWord(Word(
    //     word: "herrete",
    //     desc:
    //         "Remate, generalmente metálico, que se pone a las agujetas, cordones, cintas, etc., para que puedan entrar fácilmente por los ojetes.",
    //     image:
    //         "https://upload.wikimedia.org/wikipedia/commons/a/a8/Three_Different_Aglets.jpg"));
    // WordService1.insertWord(Word(
    //     word: "macguffin",
    //     desc:
    //         "Motivo argumental que hace avanzar la trama, aunque no tenga gran relevancia en sí mismo."));
    // WordService1.insertWord(Word(
    //     word: "ojota",
    //     desc:
    //         "Calzado a manera de sandalia, hecho de cuero o de filamento vegetal, que usaban los indígenas del Perú y de Chile, y que todavía usan los campesinos de algunas regiones de América del Sur.",
    //     image: "https://www.punomagico.com/image/ojota%20varonn.jpg"));
    // WordService1.insertWord(Word(
    //     word: "rial",
    //     desc: "Unidad monetaria de Irán y de algunos países árabes."));
    Word randomWord = wordList[Random().nextInt(wordList.length)];
    currentWord = randomWord;
    trys = 0;
    wordInputController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RAEDLE'),
      ),
      body: Expanded(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fondo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WordTile(word: currentWord),
                  const SizedBox(height: 20),
                  feedbackMessage.isNotEmpty
                      ? Text(
                          feedbackMessage,
                          style: TextStyle(
                            color: feedbackMessage
                                    .contains('¡Has adivinado la palabra!')
                                ? Colors.green
                                : Colors.red,
                          ),
                        )
                      : Container(),
                  const SizedBox(height: 20),
                  Text(
                    'Intentos: $trys',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    currentWord.desc,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  if (currentWord.image != "")
                    CachedNetworkImage(
                      imageUrl: currentWord.image,
                      fit: BoxFit.scaleDown,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  SizedBox(height: 280),
                  TextField(
                    controller: wordInputController,
                    decoration: const InputDecoration(
                      labelText: 'Ingresa una palabra',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      feedbackMessage = '';
                      processWord(wordInputController.text);
                    },
                    child: const Text('Adivinar Palabra'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      feedbackMessage = '';
                      startNewGame();
                    },
                    child: const Text('Reiniciar Juego'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void processWord(String word) {
    if (word.length == currentWord.word.length) {
      currentWord.updateGuessedWord(word);
      trys += 1;
      if (currentWord.isWordGuessed()) {
        feedbackMessage = '¡Has adivinado la palabra!';
        if (widget.accountLogged.trys == null ||
            widget.accountLogged.trys! < trys) {
          widget.accountLogged.trys = trys;
          AccountService.updateAccount(widget.accountLogged);
        }
      }
    } else {
      trys += 1;
      feedbackMessage = 'La longitud de la palabra no coincide.';
    }

    wordInputController.clear();
    setState(() {});
  }
}
