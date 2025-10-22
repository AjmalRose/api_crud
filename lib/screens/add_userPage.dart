import 'package:api_crud/provider/crud_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAdd extends StatelessWidget {
  const MyAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<CrudProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CrudProvider>(builder: (context, value, child) {
        return Center(        
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               TextField(
                controller: getData.titleContoller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'name'
                ),
               ),
               SizedBox(height: 15,),
              
              ElevatedButton(onPressed: (){
                getData.add();
                Navigator.pop(context);
              }, child: Text('Save'))
              ],
            ),
          ),
        );
      },),
    );
  }
}

