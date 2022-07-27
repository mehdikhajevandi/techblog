import 'package:flutter/material.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/home_screen.dart';
import 'package:tec/view/profile_screen.dart';
import 'package:tec/view/register_intro.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 20;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scafoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(
                  child: Image.asset(
                    Assets.images.logo.path,
                    scale: 3,
                  ),
                )),
                ListTile(
                  title: Text(
                    "پروفایل کاربری",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "درباره تک‌بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "تک‌بلاگ در گیت هاب",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scafoldBg,
          title: //appbar
              Padding(
            padding: EdgeInsets.fromLTRB(bodyMargin, 0, bodyMargin, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (() {
                    _key.currentState!.openDrawer();
                  }),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                Image(
                  image: Assets.images.logo,
                  height: size.height / 13.6,
                ),
                const Icon(Icons.search, color: Colors.black),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: IndexedStack(
              index: selectedPageIndex,
              children: [
                HomeScreen(
                    size: size,
                    textTheme: textTheme,
                    bodyMargin: bodyMargin), //0
                ProfileScreen(
                    size: size,
                    textTheme: textTheme,
                    bodyMargin: bodyMargin), //1
                RegisterIntro()
              ],
            )),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: size.height / 15,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: GradiantColors.bottomNavBackgroand,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
            ),
            BottomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 0,
      left: 0,
      child: Padding(
        padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
        child: Container(
          height: size.height / 13,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            gradient: LinearGradient(
              colors: GradiantColors.bottomNav,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: (() => changeScreen(0)),
                  icon: ImageIcon(
                    Assets.icons.home,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: (() => changeScreen(2)),
                  icon: ImageIcon(
                    Assets.icons.write,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: (() => changeScreen(1)),
                  icon: ImageIcon(
                    Assets.icons.user,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
