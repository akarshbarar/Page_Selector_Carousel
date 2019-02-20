import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Page Selector",
      theme:ThemeData(
        primaryColor: Colors.red,
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  final items=<Icon>[
    Icon(Icons.email),
    Icon(Icons.phone_android),
    Icon(Icons.comment),
    Icon(Icons.share),
    Icon(Icons.thumb_up),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Selector"),
        centerTitle: true,
      ),
      body: DefaultTabController(
          length: items.length,
          child: Builder(
              builder: (BuildContext context)=>Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: IconTheme(
                          data: IconThemeData(
                            size: 50.0,
                            color: Colors.purple,
                          ),
                          child: TabBarView(children: items)
                      ),
                    ),
                    TabPageSelector(),
                    RaisedButton(
                      child: Text("SKIP"),
                      onPressed: (){
                        TabController controler=DefaultTabController.of(context);
                        if(!controler.indexIsChanging){
                          controler.animateTo(items.length-1);
                        }
                      },
                    ),
                  ],
                ),
              )
          ),
      ),
    );
  }
}

