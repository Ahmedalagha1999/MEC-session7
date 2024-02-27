import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constatns.dart';
import 'package:task/core/managers/image_maneger/image_maneger.dart';
import 'package:task/core/managers/string_maneger/string_maneger.dart';
import 'package:task/view/screens/home_screen.dart';
import 'package:task/view/screens/market.dart';
import 'package:task/view/screens/portflio.dart';
import 'package:task/view/screens/profile_screen.dart';
import 'package:task/view_model/providers/selected_index_provider.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectedIndexProvider(),
      child: _HomeLayout(),
    );
  }
}

class _HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<_HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer<SelectedIndexProvider>(
        builder: (context, provider, _) {
          return FloatingActionButton(
            backgroundColor: containerFirstColor,
            shape: CircleBorder(),
            onPressed: () {},
            child: provider.selectedIndex == 1
                ? const Icon(
                    // Portfolio tab index
                    Icons.add, // Use trade icon for other tabs
                    color: Colors.white,
                  )
                : SvgPicture.asset(ImageManager.tradeIcon),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: BottomAppBar(
          surfaceTintColor: Colors.white,
          color: const Color(0xFFFFFFFF),
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Consumer<SelectedIndexProvider>(
            builder: (context, provider, _) => Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildNavItem(
                      ImageManager.homeIcon, StringManager.home, 0, provider),
                  _buildNavItem(ImageManager.portfolioIcon,
                      StringManager.portfolio, 1, provider),
                  const SizedBox(width: 40), // Create space for FAB
                  _buildNavItem(ImageManager.marketIcon, StringManager.market,
                      2, provider),
                  _buildNavItem(ImageManager.profileIcon, StringManager.profile,
                      3, provider),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Consumer<SelectedIndexProvider>(
        builder: (context, provider, _) {
          switch (provider.selectedIndex) {
            case 0:
              return const HomeScreen();
            case 1:
              return const PortfolioScreen();
            case 2:
              return MarketScreen();
            case 3:
              return const ProfileScreen();
            default:
              return Container();
          }
        },
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index,
      SelectedIndexProvider provider) {
    return InkWell(
      onTap: () {
        provider.updateIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            color: provider.selectedIndex == index
                ? const Color(0xFFF37135)
                : const Color(0xFF7D756C),
            height: 19,
            width: 19,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: provider.selectedIndex == index
                  ? const Color(0xFFF37135)
                  : const Color(0xFF7D756C),
            ),
          ),
        ],
      ),
    );
  }
}
