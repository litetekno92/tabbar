import 'package:flutter/material.dart';
import 'package:tabbar/models/category.dart';
import 'package:tabbar/fetchdata.dart';
import 'package:tabbar/fetchdatacat.dart';



class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({ Key key, this.title }) : super(key: key);
  final String title;
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState(title: this.title);
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  
  _MyTabbedPageState({this.title});


  final String title;
  
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: categories[0].title, 
      icon: Icon(categories[0].icon),
      ), 
      Tab(
      text: categories[1].title, 
      icon: Icon(categories[1].icon),
      ),
      Tab(
      text: categories[2].title, 
      icon: Icon(categories[3].icon),
      ),
      Tab(
      text: categories[4].title, 
      icon: Icon(categories[4].icon),
      ),
      Tab(
      text: categories[5].title, 
      icon: Icon(categories[5].icon),
      ),
      Tab(
      text: categories[6].title, 
      icon: Icon(categories[6].icon),
      )
      
  ];
  
  
  // final List<Tab> myTabs = <Tab>[
  //   Tab(text: 'LEFT'),
  //   Tab(text: 'RIGHT'),
  // ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categories.map((Category cat) {
          // return Center(child: Text(cat.title + ' ' + cat.id.toString()));
          return cat.id == 1 
          ? FetchData() 
          : FetchDataCat(cat.id);
        }).toList(),
      ),
    );
  }
}
