import 'package:flutter/material.dart';
import 'package:kitchen_app/CDM.dart';
import 'Urls.dart';
import 'Colorz.dart';

class ComplexDrawer extends StatefulWidget {
  const ComplexDrawer({Key? key}) : super(key: key);

  @override
  State<ComplexDrawer> createState() => _ComplexDrawerState();
}

class _ComplexDrawerState extends State<ComplexDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: ComplexDrawerD(),
      drawerScrimColor: Colors.transparent,
      backgroundColor: Colorz.complexDrawerCanvasColor,
    );
  }

  appBar() {
    return AppBar(
      title: Text(
        "Complex Drawer",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colorz.complexDrawerCanvasColor,
    );
  }
}

class ComplexDrawerD extends StatefulWidget {
  const ComplexDrawerD({Key? key}) : super(key: key);

  @override
  State<ComplexDrawerD> createState() => _ComplexDrawerDState();
}

class _ComplexDrawerDState extends State<ComplexDrawerD> {
  int selectedIndex = -1;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: row(),
      color: Colorz.complexDrawerCanvasColor,
    );
  }

  Widget row() {
    return Row(
      children: [
        isExpanded ? blackIconTile() : blackIconMenu(),
        invisibleSubMenus(),
      ],
    );
  }

  Widget blackIconTile() {
    return Container(
      width: 200,
      color: Colorz.complexDrawerBlack,
      child: Expanded(
        child: ListView.builder(
            itemCount: cdms.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) return controlTile();
              CDM cdm = cdms[index];
              bool selected = selectedIndex == index;
              return ExpansionTile(

                  onExpansionChanged: (z) {
                    setState(() {
                      selectedIndex = z?index:-1;
                    });
                  },
                  leading: Icon(
                    cdm.icon,
                    color: Colors.white,
                  ),
                  title: Text(
                    cdm.title,
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: cdm.submenus.isEmpty
                      ? null
                      : Icon(
                          selected
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: Colors.white,
                        ),
                  children: cdm.submenus.map((submenu) {
                    return sMenuButton(submenu, false);
                  }).toList());
            }),
      ),
    );
  }

  Widget controlTile() {
    return Padding(
      padding: const EdgeInsets.only(top:20,bottom: 30.0),
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('Flutter Ship',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
      onTap: expandoOrShrinkDrawer,
      ),

    );
  }

   Widget blackIconMenu() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 100,
      color: Colorz.complexDrawerBlack,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (context, index) {
                  if (index == 0) return controlButton();
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Icon(
                        cdms[index].icon,
                        color: Colors.white,
                      ),
                    ),
                  );
                }),
          ),
          accountButton(isMini: true),
        ],
      ),

    );
  }

  Widget accountButton({bool isMini = false}){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height:isMini?45: 55,
      width:isMini?45: 55,
      decoration: BoxDecoration(
          image:DecorationImage(
              image:NetworkImage(Urls.googleImg),
          fit: BoxFit.fill) ,
          borderRadius:BorderRadius.circular(isMini?6:8),
        

      ),
    );
  }
  Widget accountTile(){
    return Container();
  }

  Widget invisibleSubMenus() {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isExpanded ? 0 : 125,
        color: Colorz.complexDrawerCanvasColor,
        alignment: Alignment.center,
        child: ListView.builder(
            itemCount: cdms.length,
            itemBuilder: (context, index) {
              CDM cmd = cdms[index];
              if (cmd == null)
                return Container(
                  height: 95,
                );
              bool selected = selectedIndex == index;
              bool isValidSubMenu = selected && cmd.submenus.isNotEmpty;

              return subMenuWidget(
                  [cmd.title]..addAll(cmd.submenus), isValidSubMenu);

              return invisibleSubMenusWidget();
            }));
  }

  Widget controlButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 35),
      child: InkWell(
        onTap: expandoOrShrinkDrawer,
        child: Container(
          height: 45,
          child: FlutterLogo(),
        ),
      ),
    );
  }

  Widget invisibleSubMenusWidget() {
    return Container(
      height: 45,
    );
  }

  Widget subMenuWidget(List<String> submenus, bool isValidSubMenu) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isValidSubMenu ? submenus.length.toDouble()*37.5: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isValidSubMenu
              ? Colorz.complexDrawerBlueGrey
              : Colors.transparent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), bottomRight: Radius.circular(8))),
      child: ListView.builder(
          padding: EdgeInsets.all(6),
          itemCount: isValidSubMenu ? submenus.length : 0,
          itemBuilder: (context, index) {
            String subMenu = submenus[index];
            return sMenuButton(subMenu, index == 0);
          }),
    );
  }

  Widget sMenuButton(String subMenu, bool isTitle) {
    return InkWell(
      onTap: () {
        //Toda Handle the function
        //if index==0? donothing:do yourlogic here
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          subMenu,
          style: TextStyle(
              color: isTitle ? Colors.white : Colors.grey[100],
              fontSize: isTitle ? 17 : 14,
              fontWeight: isTitle ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }

/* List<IconData> icons=[
    Icons.grid_view_outlined,
    Icons.subscriptions_outlined,
    Icons.markunread_mailbox_outlined,
    Icons.pie_chart_outline,
    Icons.power_outlined,
    Icons.explore_outlined,
    Icons.settings_outlined
  ];*/

  static List<CDM> cdms = [
    CDM(Icons.grid_view_outlined, "Control", []),
    CDM(Icons.grid_view_outlined, "Dashboard", []),
    CDM(Icons.subscriptions_outlined, "Category", ["HTML & CSS", "Javascript"]),
    CDM(Icons.markunread_mailbox_outlined, "Posts", ["Blog", "Affilate"]),
    CDM(Icons.pie_chart_outline, "Analytics", []),
    CDM(Icons.trending_up_outlined, "Chart", []),
    CDM(Icons.power_outlined, "Plugins", ["HTML & CSS", "Javascript","Blog", "Affilate"]),
    CDM(Icons.explore_outlined, "Explore", []),
    CDM(Icons.settings_outlined, "Settings", []),
  ];

  void expandoOrShrinkDrawer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
