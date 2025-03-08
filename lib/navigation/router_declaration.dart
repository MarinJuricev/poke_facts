import 'package:go_router/go_router.dart';
import 'package:poke_facts/detail/poke_detail_page.dart';
import 'package:poke_facts/home/home_page.dart';
import 'package:poke_facts/list/bloc/poke_list_state.dart';
import 'package:poke_facts/list/poke_list_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: pageHome,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'list',
          name: pageList,
          builder: (context, state) {
            final query = state.uri.queryParameters[homePageQueryParam] ?? '';
            final tag = state.uri.queryParameters[homePageTagParam] ?? '';

            return PokeListPage(query: query, tag: tag);
          },
        ),
        GoRoute(
          path: 'details',
          name: pageDetails,
          builder: (context, state) {
            final item = state.extra as PokeListItem;
            return PokeDetailPage(item: item);
          },
        ),
      ],
    ),
  ],
);

const pageHome = 'pageHome';
const pageList = 'pageList';
const pageDetails = 'pageDetails';

const homePageQueryParam = 'query';
const homePageTagParam = 'tag';
