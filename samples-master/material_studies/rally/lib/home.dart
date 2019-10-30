// Copyright 2019-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rally/tabs/accounts.dart';
import 'package:rally/tabs/bills.dart';
import 'package:rally/tabs/budgets.dart';
import 'package:rally/tabs/overview.dart';
import 'package:rally/tabs/settings.dart';

const int tabCount = 5;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  _HomePageState() {
    _tabController = TabController(length: tabCount, vsync: this);
  }

  @override
  void initState() {
    super.initState();
    print('_HomePageState initState');

    _tabController.addListener(() {
      if (_tabController.indexIsChanging &&
          _tabController.previousIndex != _tabController.index) {
        setState(() {});
      }
    });
  }

  @override
  dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Theme(
              // This theme effectively removes the default visual touch
              // feedback for tapping a tab, which is replaced with a custom
              // animation.
              data: theme.copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: TabBar(
                // Setting isScrollable to true prevents the tabs from being
                // wrapped in [Expanded] widgets, which allows for more
                // flexible sizes and size animations among tabs.
                isScrollable: true,
                labelPadding: EdgeInsets.zero,
                tabs: _buildTabs(theme),
                controller: _tabController,
                // This removes the tab indicator.
                indicatorColor: Colors.transparent,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _buildTabViews(),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTabs(ThemeData theme) {
    return <Widget>[
      _buildTab(theme, Icons.pie_chart, 'OVERVIEW', 0),
      _buildTab(theme, Icons.attach_money, 'ACCOUNTS', 1),
      _buildTab(theme, Icons.money_off, 'BILLS', 2),
      _buildTab(theme, Icons.table_chart, 'BUDGETS', 3),
      _buildTab(theme, Icons.settings, 'SETTINGS', 4),
    ];
  }

  List<Widget> _buildTabViews() {
    return [
      OverviewView(),
      AccountsView(),
      BillsView(),
      BudgetsView(),
      SettingsView(),
    ];
  }

  Widget _buildTab(
    ThemeData theme,
    IconData iconData,
    String title,
    int index,
  ) {
    return _RallyTab(
      theme.textTheme.button,
      Icon(iconData),
      title,
      _tabController.index == index,
    );
  }
}

class _RallyTab extends StatefulWidget {
  final TextStyle style;
  final Text titleText;
  final Icon icon;
  final bool isExpanded;

  _RallyTab(TextStyle style, Icon icon, String title, bool isExpanded)
      : this.style = style,
        this.titleText = Text(title, style: style),
        this.icon = icon,
        this.isExpanded = isExpanded;

  _RallyTabState createState() => _RallyTabState();
}

class _RallyTabState extends State<_RallyTab>
    with SingleTickerProviderStateMixin {
  Animation<double> _titleSizeAnimation;
  Animation<double> _titleFadeAnimation;
  Animation<double> _iconFadeAnimation;
  AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _titleSizeAnimation = _controller.view;
    _titleFadeAnimation = _controller.drive(CurveTween(curve: Curves.easeOut));
    _iconFadeAnimation = _controller.drive(Tween(begin: 0.6, end: 1));
    if (widget.isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(_RallyTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  Widget build(BuildContext context) {
    // Calculate the width of each unexpanded tab by counting the number of
    // units and dividing it into the screen width. Each unexpanded tab is 1
    // unit, and there is always 1 expanded tab which is 1 unit + any extra
    // space determined by the multiplier.
    final double width = MediaQuery.of(context).size.width;
    final double expandedTitleWidthMultiplier = 2;
    final double unitWidth = width / (tabCount + expandedTitleWidthMultiplier);

    return SizedBox(
      height: 56,
      child: Row(
        children: <Widget>[
          FadeTransition(
            child: SizedBox(
              width: unitWidth,
              child: widget.icon,
            ),
            opacity: _iconFadeAnimation,
          ),
          FadeTransition(
            child: SizeTransition(
              child: SizedBox(
                width: unitWidth * expandedTitleWidthMultiplier,
                child: Center(child: widget.titleText),
              ),
              axis: Axis.horizontal,
              axisAlignment: -1,
              sizeFactor: _titleSizeAnimation,
            ),
            opacity: _titleFadeAnimation,
          ),
        ],
      ),
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
}
