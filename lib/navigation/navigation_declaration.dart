import 'package:go_router/go_router.dart';
import 'package:poke_facts/detail/poke_detail_page.dart';
import 'package:poke_facts/home/home_page.dart';
import 'package:poke_facts/list/poke_list_page.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: pageHome,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'list',
          name: pageList,
          builder: (context, state) => const PokeListPage(),
        ),
        GoRoute(
          path: 'details',
          name: pageDetails,
          builder: (context, state) => const PokeDetailPage(),
        ),
      ])
]);

const pageHome = 'pageHome';
const pageList = 'pageList';
const pageDetails = 'pageDetails';
