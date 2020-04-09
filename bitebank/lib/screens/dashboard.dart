import 'package:flutter/material.dart';

import 'contacts_lista.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          centerTitle: true,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('image/bytebank_logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          (MaterialPageRoute(
                              builder: (context) => ContactsList(),
                          )),
                      );

                    },
                    child: Container (
                      padding: EdgeInsets.all(8),
                      color: Colors.green,
                      width: 120,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.people, color: Colors.white, size: 24,),
                          Text('Contacts', style: TextStyle(color: Colors.white, fontSize: 16),),
                        ],
                      ),),
                  ),
                ),
              ),
            ]
        )
    );
  }
}