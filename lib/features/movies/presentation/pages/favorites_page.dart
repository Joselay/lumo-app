import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/toast_utils.dart';
import '../viewmodels/movies_bloc.dart';
import '../viewmodels/movies_event.dart';
import '../viewmodels/movies_state.dart';
import '../widgets/movie_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesBloc>().add(const MoviesEvent.loadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Favorites',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: SafeArea(
        child: BlocListener<MoviesBloc, MoviesState>(
          listener: (context, state) {
            if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
              ToastUtils.showError(
                context,
                title: 'Error',
                description: state.errorMessage,
              );
            }
          },
          child: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
            if (state.isFavoritesLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  radius: 16,
                ),
              );
            }

            if (state.favoriteMovies.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/empty.svg',
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'No Favorites Yet',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.label.resolveFrom(context),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Bookmark your favorite movies to see them here',
                        style: TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.systemGrey.resolveFrom(context),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                CupertinoSliverRefreshControl(
                  onRefresh: () async {
                    context.read<MoviesBloc>().add(
                          const MoviesEvent.loadFavorites(),
                        );
                  },
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final movie = state.favoriteMovies[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: MovieCard(movie: movie),
                        );
                      },
                      childCount: state.favoriteMovies.length,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        ),
      ),
    );
  }
}
