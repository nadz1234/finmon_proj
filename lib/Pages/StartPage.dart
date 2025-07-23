import 'package:finmon_proj/Pages/HomePage.dart';
import 'package:finmon_proj/Pages/HistoryPage.dart';
import 'package:finmon_proj/Pages/UserLogin.dart';
import 'package:finmon_proj/component/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartPage extends ConsumerStatefulWidget {
  const StartPage({super.key});

  @override
  ConsumerState<StartPage> createState() => _StartPageState();
}

class _StartPageState extends ConsumerState<StartPage> {
  int index = 0;
  final pages = <Widget>[HomePage(), MyHistory(), SettingsPage()];

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[index],
      bottomNavigationBar: TabBarMaterialWidget(
        index: index,
        onChangedTab: onChangedTab,
      ),
    );
  }
}
