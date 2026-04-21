import 'package:build_with_routes/pages/home_page.dart';
import 'package:build_with_routes/pages/product_detail.dart';
import 'package:build_with_routes/pages/product_detail_edit.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();
  static GoRouter router = GoRouter(
    initialLocation: "/homePage",
    routes: [
      GoRoute(
        path: "/homePage",
        builder: (context, state) {
        return HomePage();
        },
      ),
      GoRoute(
        //Navigation with data
        path: "/product-detail/:id",
        builder: (context, state) {
        final id = state.pathParameters["id"] ?? '';
        //Navigation menggunakan extra sangat tidak disarankan untuk diwebsite
        final penjualan = state.extra as String ?;
        final barang = state.uri.queryParameters["barang"] ?? '';
        final stok = state.uri.queryParameters["stock"] ?? '';
        return ProductDetailPage(
          id:id,
          barang:barang, 
          stock: stok, 
          penjualan : penjualan ??'',
         );
        },
      ),
      //Navigation Menggunakan Flat GoRoute
      GoRoute(
        path: "/product-detail/:id/edited",
        builder: (context, state) {
        final id = state.pathParameters["id"] ?? '';
        final barang = state.uri.queryParameters["barang"] ?? '';
        return ProductDetailEdit(id: id, barang: barang, );
        },
      ),
    ],
    );
}

  