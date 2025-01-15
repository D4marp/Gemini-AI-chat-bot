import 'package:flutter/material.dart';
import '../fragment/fragment_generate_image.dart';
import '../fragment/fragment_generate_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 5, // Sedikit bayangan untuk kesan dinamis
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Mars  AI',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: setTabBar(),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height - AppBar().preferredSize.height - 80,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TabBarView(
                controller: tabController,
                children: const [
                  FragmentGenerateText(),
                  FragmentGenerateImage(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Tambahkan logika untuk tombol ini
        },
        label: const Text('Help'),
        icon: const Icon(Icons.help_outline),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }

  TabBar setTabBar() {
    return TabBar(
      controller: tabController,
      labelColor: Colors.deepPurpleAccent,
      unselectedLabelColor: Colors.grey,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.deepPurpleAccent.withOpacity(0.8),
      ),
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      tabs: const [
        Tab(
            text: 'Generate Text',
            icon: Icon(Icons.text_fields, color: Colors.black),
        
        ),
        Tab(
          text: 'Generate Image',
          icon: Icon(Icons.image_search,color: Colors.black),
          ),
      ],
    );
  }
}
