/*
 * @Description: 路由管理
 * @Author: luoguoxiong
 * @Date: 2019-08-24 17:29:18
 */

import 'package:flutter/material.dart';
import './catalog/index.dart';
import './brand/index.dart';
import './goodsDetail/index.dart';
import './tipicDetail/index.dart';
import './search/index.dart';
import './noFound.dart';
import './login/index.dart';
import 'package:easy_market/page/index.dart';

class Router {
  // 路由声明
  static Map<String, Function> routes = {
    '/catalog': (context, {arguments}) => Catalog(arguments: arguments),
    '/goodsDetail': (context, {arguments}) => GoodsDetail(arguments: arguments),
    '/topicDetail': (context, {arguments}) => TopicDetail(arguments: arguments),
    '/search': (context) => Search(),
    '/home': (context) => Page(),
    '/login': (context) => Login(),
    '/brand': (context, {arguments}) => Brand(arguments: arguments),
  };

  // 路由初始化
  static run(RouteSettings settings) {
    final Function pageContentBuilder = Router.routes[settings.name];

    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        // 传参路由
        return MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
      } else {
        // 无参数路由
        return MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
      }
    } else {
      // 404页
      return MaterialPageRoute(builder: (context) => NoFoundPage());
    }
  }

// 组件跳转
  static link(Widget child, String routeName, BuildContext context,
      [Map parmas]) {
    return GestureDetector(
      onTap: () {
        if (parmas != null) {
          Navigator.pushNamed(context, routeName, arguments: parmas);
        } else {
          Navigator.pushNamed(context, routeName);
        }
      },
      child: child,
    );
  }

// 方法跳转
  static push(String routeName, BuildContext context, [Map parmas]) {
    if (parmas != null) {
      Navigator.pushNamed(context, routeName, arguments: parmas);
    } else {
      Navigator.pushNamed(context, routeName);
    }
  }

  static pop(context) {
    Navigator.pop(context);
  }
}
