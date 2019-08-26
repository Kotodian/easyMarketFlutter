import 'package:easy_market/utils/http.dart';

var http = new HttpUtils();

class Api {
  // 获取首页数据
  static Future getHomeData() async {
    return await http.get('/');
  }

  // 获取专题页数据
  static Future getTopicData({int page, int size}) async {
    return await http.get('/topic/list', {'page': page, 'size': size});
  }

  // 获取分类页tabList
  static Future getSortTabs() async {
    return await http.get('/catalog/index');
  }

  // 获取所有商品的数量
  static Future getGoodsCount() async {
    return await http.get('/goods/count');
  }

  // 获取某分类的相关信息
  static Future getCategoryMsg({int id}) async {
    return await http.get('/catalog/current', {'id': id});
  }
}
