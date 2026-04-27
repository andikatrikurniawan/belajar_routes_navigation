import 'package:build_with_routes/pages/event_detail_page.dart';
import 'package:build_with_routes/pages/event_page.dart';
import 'package:build_with_routes/pages/flexsible_page.dart';
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
        routes: [
          GoRoute(
            path: "event",
            builder: (context, state) {
              return EventPage();
             },
            routes:[
              GoRoute(
              path: "detail",
              builder: (context, state) {
                return EventDetailPage();
               },
            routes:[
              GoRoute(
              path: "flexible",
              builder: (context, state) {
                return FlexsiblePage();
               },
              ),
             ] 
            ),
           ] 
          ),
        ],
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

  