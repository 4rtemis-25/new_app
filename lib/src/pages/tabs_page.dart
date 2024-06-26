import 'package:flutter/material.dart';
import 'package:new_app/src/pages/tab1_page.dart';
import 'package:new_app/src/pages/tab2_page.dart';
import 'package:new_app/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => _NavegacionModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Paginacion(),
      ),
    );
  }
}

class _Paginacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: const [
        BottomNavigationBarItem(icon: Icon( Icons.person ), label: 'Para Ti'),
        BottomNavigationBarItem(icon: Icon( Icons.public ), label: 'Encabezados'),
      ]
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);
    final newService = Provider.of<NewsService>(context);

    return PageView(
      controller: navegacionModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Page(),

        Tab2Page()
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier{
  
  int _paginaActual = 0;
  PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

  set paginaActual( int valor ) {
    _paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;

}