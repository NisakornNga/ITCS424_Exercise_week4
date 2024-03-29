import 'package:flutter/material.dart';
import 'package:app/tabbarPage/Veterinary.dart';
import 'package:app/tabbarPage/Vaccination.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Futura',
        primaryColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 2,
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(
        title: Text(
          'Appoinment', 
          style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          //_topBar(),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Veterinary(),
                Vaccination(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSize _appBar({required Widget title}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(106),
      child: Container(
        decoration: _boxDecoration(),
        child: Column(
          children: [
            _topBar(),
            _tabBar(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      gradient: LinearGradient(
        
        colors: [
          Colors.white,
          Colors.indigo.shade200,
          Colors.indigo.shade400,
          Colors.indigo.shade700,
          Colors.indigo.shade900,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _topBar() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Appoinment',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.blueGrey.shade300,
      tabs: [
        Tab(
          text: 'Veterinary',
        ),
        Tab(
          text: 'Vaccination',
        ),
      ],
    );
  }
}
