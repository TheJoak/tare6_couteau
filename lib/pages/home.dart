// import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:clase_couteau/pages/edad.dart';
import 'package:clase_couteau/pages/noticias.dart';
import 'package:clase_couteau/pages/sexo.dart';
import 'package:clase_couteau/pages/universidad.dart';
import 'package:clase_couteau/pages/clima.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List tabItems = [
    'Predecir el Sexo',
    'Predecir la Edad',
    'Universidades',
    'El Clima en RD',
    'Las Noticias',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(
              tabItems[_selectedIndex],
              style: const TextStyle(
                color: Color.fromARGB(255, 54, 64, 203),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                double screenWidth = MediaQuery.of(context).size.width;
                double screenHeight = MediaQuery.of(context).size.height;

                double popupWidthPercentage = 1.0;
                double popupHeightPercentage = 0.7; 

                double popupWidth = screenWidth * popupWidthPercentage;
                double popupHeight = screenHeight * popupHeightPercentage;

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: const Color.fromARGB(255, 216, 13, 13),
                  builder: (BuildContext context) {
                    return Container(
                      width: popupWidth,
                      height: popupHeight,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            color: const Color.fromARGB(255, 61, 69, 212),
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(
                                      Icons.keyboard_arrow_left_rounded,
                                      color: Color.fromARGB(255, 216, 216, 216),
                                    ),
                                    onPressed: () {}),
                                const Expanded(
                                  child: Center(
                                    child: Text(
                                      'Desarrollador de la app',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(90),
                                      child: const Image(
                                        image: AssetImage(
                                            'assets/images/mifoto2x2.jpg'),
                                        width: 180,
                                        height: 180,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        'Alexander Hilario Castillo',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        '20221927@itla.edu.do\nDesarrrollador de software.',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(255, 129, 111, 111),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        '''Sobre Mi''',
                                        style: TextStyle(
                                          fontSize: 21,
                                          color:
                                              Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        '''Mi nombre es Alexander Hilario Castillo, Estudiante de la carrera de Desarrollo de Software en el ITLA y ahora me encuentro cursando mi último cuatrimestre, ¿Viste que dura me quedó la app? ¡Contrátame!''',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 65, 65, 65),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    image: AssetImage('assets/images/mifoto2x2.jpg'),
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.wc_outlined),
            title: const Text('Sexo'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.cake_outlined),
            title: const Text('Edad'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.school_rounded),
            title: const Text('Estudios'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.cloudy_snowing),
            title: const Text('Clima'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.newspaper_rounded),
            title: const Text('Noticias'),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const <Widget>[
          GenderPredictionTab(),
          AgePredictionTab(),
          UniversityTab(),
          WeatherApp(),
          News(),

        ],
      ),
    );
  }
}
