import 'package:flutter/material.dart';

import 'main.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color(0xffffffff),
        child: ListView(
          padding: EdgeInsets.all(8),
          physics: const BouncingScrollPhysics(),
          children: [
            Container(height: 35,),
            userTile(),
            divider(),
            colorTiles(),
          ],
        ),

      ),
    );
  }

  Widget userTile() {
    String url =
        "https://cdn.pixabay.com/photo/2021/08/06/19/25/man-6527045_960_720.jpg";
    String userName = "Dharmesh Gevariya";
    String emailAddress = "gevariya.d@gmail.com";
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
      title: Text(userName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      subtitle: Text(
        emailAddress, style: TextStyle(color: Colors.deepPurple[400]),),
      trailing: GestureDetector(
        onTap: (){

          print("Container clicked");
          },
        child: Container(
          child: Icon(Icons.logout_outlined),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.15),
              borderRadius: BorderRadius.circular(18)
          ),
        ),
      ),
      
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Widget divider() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Divider(thickness: 1,));
  }

  Widget colorTiles() {
    return Column(
      children: [
        colorTile(Icons.person_outlined,Colors.deepPurple,"Account Details"),
        colorTile(Icons.settings_outlined,Colors.cyan,"Setting"),
        colorTile(Icons.payment_outlined,Colors.red,"Payment"),
        colorTile(Icons.wallet_outlined,Colors.amber,"Wallet"),
        colorTile(Icons.favorite_outlined,Colors.black,"Favorite"),
        bwTiles()
      ],
    );
  }

  Widget bwTiles(){
    return Column(
      children: [
        bwTile(Icons.info_outline,"FAQs"),
        bwTile(Icons.print_outlined,"Print"),
      ],
    );

  }

  Widget bwTile(IconData icon,String text){
    Color color = Colors.black;
    return colorTile(Icons.info_outline,color,text,blackAndWhite:true);
  }

  Widget colorTile(IconData icon,Color color,String text,{bool blackAndWhite=false}) {
    Widget leading= Container(
      child: Icon(icon,color: color,),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          color: blackAndWhite?Color(0xfff3f4fe):color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(18)
      ),
    );
    Widget title= Text(text,style: TextStyle(fontWeight: FontWeight.bold),);
    Widget trailing = Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,);
    return Padding(
     padding: const EdgeInsets.fromLTRB(0,5,0,5),
      child: ListTile(
        leading: leading,
        title: title,
        trailing: trailing,
      ),
    );

  }
}
