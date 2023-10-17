import 'package:flutter/material.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class PeopleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  List<String> kitchenNames = ["Yeongsol Kim", "Anna", "Jack", "John"];
  List<String> hallNames = ["Sumin", "Owen", "Danny", "Jin", "Suzuka", "Hans", "Tonny"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("People"),
          backgroundColor: Colors.deepOrange,
          leading: Container(),
        ),
        // body: ListView.builder(
        //   itemCount: names.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Card (
        //       child: ListTile(
        //         leading: FlutterLogo(),
        //         title: Text('${names[index]}'),
        //         trailing: Icon(Icons.more_vert),
        //       ),
        //     );
        //   },
        // ),
        body: ScrollableListTabView(
          tabHeight: 48,
          tabs: [
            ScrollableListTab(
              tab: ListTab(label: Text('Kitchen'), icon: Icon(Icons.group)),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: kitchenNames.length,
                itemBuilder: (_, index) => ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    alignment: Alignment.center,
                    child: Text(index.toString()),
                  ),
                  title: Text('${kitchenNames[index]}'),
                ),
              )
            ),
            ScrollableListTab(
                tab: ListTab(label: Text('Hall'), icon: Icon(Icons.group)),
                body: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: hallNames.length,
                  itemBuilder: (_, index) => ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      alignment: Alignment.center,
                      child: Text(index.toString()),
                    ),
                    title: Text('${hallNames[index]}'),
                  ),
                )
            ),
          ],
        ),
      ),
    );
    // TODO: implement build
  }
}

