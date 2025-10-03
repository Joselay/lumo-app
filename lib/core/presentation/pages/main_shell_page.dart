import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../features/movies/data/datasources/movies_api.dart';
import '../../../features/movies/data/repositories/movies_repository.dart';
import '../../../features/movies/domain/usecases/get_movies_usecase.dart';
import '../../../features/movies/domain/usecases/toggle_favorite_usecase.dart';
import '../../../features/movies/domain/usecases/get_favorite_movies_usecase.dart';
import '../../../features/movies/presentation/viewmodels/movies_bloc.dart';
import '../../data/api_client.dart';
import '../widgets/bottom_navigation_bar.dart';

class MainShellPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainShellPage({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  @override
  Widget build(BuildContext context) {
    final repository = MoviesRepository(MoviesApi(ApiClient.instance));

    return BlocProvider(
      create: (context) => MoviesBloc(
        getMoviesUseCase: GetMoviesUseCase(repository),
        getGenresUseCase: GetGenresUseCase(repository),
        toggleFavoriteUseCase: ToggleFavoriteUseCase(repository),
        getFavoriteMoviesUseCase: GetFavoriteMoviesUseCase(repository),
      ),
      child: CupertinoPageScaffold(
        child: Column(
          children: [
            Expanded(child: widget.navigationShell),
            AppBottomNavigationBar(
              currentIndex: widget.navigationShell.currentIndex,
              onTap: (index) {
                widget.navigationShell.goBranch(
                  index,
                  initialLocation: index == widget.navigationShell.currentIndex,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}