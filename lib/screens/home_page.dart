import 'package:api_crud/provider/crud_provider.dart';
import 'package:api_crud/screens/add_userPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CrudProvider>(context, listen: false).getData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => MyAdd()));
        },
      ),
      body: Consumer<CrudProvider>(
        builder: (context, value, child) {
          if (value.isLoadding) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            );
          }
          return ListView.builder(
            itemCount: value.crudValue.length,
            itemBuilder: (context, index) {
              final data = value.crudValue[index];
              return ListTile(
                title: Text(data.id ?? ""),
                subtitle: Text(data.title ?? ""),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        //  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MyEdit(crud:newVal)));
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        value.dltProvider(data.id.toString());
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
