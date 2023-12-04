import 'package:flutter/material.dart';
import 'package:practica2moviles/accounts/account.dart';
import 'package:practica2moviles/accounts/accountService.dart';
import 'package:practica2moviles/word/word.dart';
import 'package:practica2moviles/word/wordService.dart';
import 'screens/homeScreen.dart';

void main() async {
  WordService1.db();
  //WordService1.onUpgrade(await WordService1.db(), 1, 2);

  WordService1.insertWord(Word(
      word: "ñapa",
      desc: "Añadidura, especialmente la que se da como propina o regalo."));
  WordService1.insertWord(Word(
      word: "somormujo",
      desc:
          "Ave palmípeda, con pico recto y agudo, alas cortas, patas vestidas, plumas del lomo, cabeza y cuello negras, pecho y abdomen blancos, costados castaños, y un pincel de plumas detrás de cada ojo, que vuela poco y puede mantener por mucho tiempo la cabeza sumergida bajo el agua.",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/2/27/Podiceps_cristatus_2_-_Lake_Dulverton.jpg"));
  WordService1.insertWord(Word(
      word: "zafio",
      desc:
          "Dicho de una persona: Grosera o tosca en sus modales, o carente de tacto en su comportamiento"));
  WordService1.insertWord(
      Word(word: "inefable", desc: "Que no se puede explicar con palabras."));
  WordService1.insertWord(
      Word(word: "ofuscar", desc: "Deslumbrar, turbar la vista."));
  WordService1.insertWord(Word(word: "baladí", desc: "De poca importancia."));
  WordService1.insertWord(
      Word(word: "ubérrimo", desc: "Muy abundante y fértil."));
  WordService1.insertWord(Word(word: "culamen", desc: "Culo (nalgas)."));
  WordService1.insertWord(Word(word: "papahuevos", desc: "Papanatas."));
  WordService1.insertWord(Word(
      word: "papichulo",
      desc: "Hombre que, por su atractivo físico, es objeto de deseo."));
  WordService1.insertWord(
      Word(word: "uebos", desc: "Necesidad, cosa necesaria. Ej: Uebos me es."));
  WordService1.insertWord(
      Word(word: "jipiar", desc: "Hipar, gemir, gimotear."));
  WordService1.insertWord(Word(
      word: "amigovio",
      desc:
          "Persona que mantiene con otra una relación de menor compromiso formal que un noviazgo."));
  WordService1.insertWord(Word(
      word: "coprolito",
      desc: "Excremento fósil.",
      image:
          "https://uvn-brightspot.s3.amazonaws.com/assets/vixes/btg/curiosidades.batanga.com/files/Coprolitos-informacion-en-heces-fosiles-1.jpg"));
  WordService1.insertWord(Word(word: "abuhado", desc: "Hinchado o abotagado."));
  WordService1.insertWord(Word(
      word: "ayeaye",
      desc:
          "Prosimio del tamaño de un gato, con hocico agudo, la cola más larga que el cuerpo y muy poblada, los dedos muy largos y delgados y con uñas corvas y puntiagudas, excepto los pulgares de las extremidades posteriores que las tienen planas.",
      image:
          "https://allyouneedisbiology.files.wordpress.com/2017/02/aye-aye.jpg?w=1038&h=576&crop=1"));
  WordService1.insertWord(Word(
      word: "narval",
      desc:
          "Cetáceo de unos seis metros de largo, con cabeza grande, hocico obtuso, boca pequeña, sin más dientes que dos incisivos superiores, uno corto y otro que se prolonga horizontalmente hasta cerca de tres metros; cuerpo robusto, liso, brillante, blanco y con vetas pardas por el lomo, dos aletas pectorales y cola grande y ahorquillada.",
      image:
          "https://cflvdg.avoz.es/sc/vlLzTsHdBtzCDpJZ_dQ1887w_KU=/1280x/2019/05/02/00121556811865576599386/Foto/narval.jpg"));
  WordService1.insertWord(Word(
      word: "espurio",
      desc: "Bastardo (que degenera de su origen o naturaleza)."));
  WordService1.insertWord(Word(
      word: "berbiquí",
      desc:
          "Manubrio semicircular o en forma de doble codo que sirve para taladrar o hacer agujeros.",
      image:
          "https://m.media-amazon.com/images/I/71AY1sWkpLL._AC_UF894,1000_QL80_.jpg"));
  WordService1.insertWord(Word(
      word: "galocha",
      desc:
          "Calzado de madera con refuerzos de hierro, usado en algunas provincias para andar por la nieve, por el lodo o por suelo muy mojado.",
      image:
          "https://4.bp.blogspot.com/_EKJTC-QOtoo/SXz0_alwLtI/AAAAAAAAHVc/Vf_kQ07f8Rw/s280/calzado+madrena5.jpg"));
  WordService1.insertWord(Word(
      word: "pelerina",
      desc: "Toquilla de punto, como capa corta, que usan las mujeres.",
      image:
          "https://m.media-amazon.com/images/I/4158U1fdgeL._UF894,1000_QL80_.jpg"));
  WordService1.insertWord(Word(
      word: "espolín",
      desc:
          "Tela de seda con flores esparcidas, como las del brocado de oro o de seda.",
      image:
          "https://garin1820.com/wp-content/uploads/2019/07/portada-espolin-valencia-1080x675.jpg"));
  WordService1.insertWord(Word(
      word: "viticultor", desc: "Perteneciente o relativo a la viticultura."));
  WordService1.insertWord(Word(
      word: "zurrapa",
      desc:
          "Brizna, pelillo o sedimento que se halla en los líquidos y que poco a poco se va sentando."));
  WordService1.insertWord(Word(
      word: "quincalla",
      desc:
          "Conjunto de objetos de metal, generalmente de escaso valor, como tijeras, dedales, imitaciones de joyas."));
  WordService1.insertWord(Word(
      word: "pipeta",
      desc:
          "Tubo de cristal ensanchado en su parte media, que sirve para trasladar pequeñas porciones de líquido de un vaso a otro.",
      image:
          "https://esp.labbox.com/wp-content/uploads/sites/2/2020/07/MPI2-010-005.jpg"));
  WordService1.insertWord(Word(
      word: "herrete",
      desc:
          "Remate, generalmente metálico, que se pone a las agujetas, cordones, cintas, etc., para que puedan entrar fácilmente por los ojetes.",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/a/a8/Three_Different_Aglets.jpg"));
  WordService1.insertWord(Word(
      word: "macguffin",
      desc:
          "Motivo argumental que hace avanzar la trama, aunque no tenga gran relevancia en sí mismo."));
  WordService1.insertWord(Word(
      word: "ojota",
      desc:
          "Calzado a manera de sandalia, hecho de cuero o de filamento vegetal, que usaban los indígenas del Perú y de Chile, y que todavía usan los campesinos de algunas regiones de América del Sur.",
      image: "https://www.punomagico.com/image/ojota%20varonn.jpg"));
  WordService1.insertWord(Word(
      word: "rial",
      desc: "Unidad monetaria de Irán y de algunos países árabes."));
  runApp(const MyApp());

  // AccountService.db();
  // var characters = await AccountService.loadAccounts();
  // print(characters);

  // var characters = await WordService1.loadWords();
  // print(characters);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordle Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Establece HomeScreen como la pantalla inicial
    );
  }
}
