import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:intl/intl.dart';
import '../../../../core/data/api_client.dart';
import '../../data/datasources/movies_api.dart';
import '../../data/repositories/movies_repository.dart';
import '../../domain/usecases/get_movie_showtimes_usecase.dart';
import '../viewmodels/movie_details_bloc.dart';
import '../viewmodels/movie_details_event.dart';
import '../viewmodels/movie_details_state.dart';
import '../../domain/entities/movie.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsBloc(
        getMovieShowtimesUseCase: GetMovieShowtimesUseCase(
          MoviesRepository(MoviesApi(ApiClient.instance)),
        ),
      )..add(MovieDetailsEvent.started(movie.id)),
      child: _MovieDetailsView(movie: movie),
    );
  }
}

class _MovieDetailsView extends StatelessWidget {
  final Movie movie;

  const _MovieDetailsView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
        border: null,
        middle: Text(
          movie.title,
          style: const TextStyle(
            color: CupertinoColors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (movie.posterImage != null)
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(movie.posterImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white,
                          ),
                        ),
                        const SizedBox(height: 12),

                        Row(
                          children: [
                            if (movie.rating != null) ...[
                              const Icon(
                                lucide.LucideIcons.star,
                                color: CupertinoColors.systemYellow,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                movie.rating!.toStringAsFixed(1),
                                style: const TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 16),
                            ],
                            const Icon(
                              lucide.LucideIcons.clock,
                              color: CupertinoColors.systemGrey,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              movie.durationFormatted ??
                                  '${movie.duration} min',
                              style: const TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Icon(
                              lucide.LucideIcons.calendar,
                              color: CupertinoColors.systemGrey,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              movie.releaseDate,
                              style: const TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        if (movie.genres.isNotEmpty)
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: movie.genres.map((genre) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.systemGrey6
                                      .resolveFrom(context),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  genre.name,
                                  style: const TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        const SizedBox(height: 24),

                        const Text(
                          'Overview',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          movie.description,
                          style: const TextStyle(
                            fontSize: 15,
                            color: CupertinoColors.systemGrey,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 32),

                        const Text(
                          'Showtimes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state.status == MovieDetailsStatus.loading) {
                  return const SliverFillRemaining(
                    child: Center(child: CupertinoActivityIndicator()),
                  );
                }

                if (state.status == MovieDetailsStatus.failure) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            lucide.LucideIcons.alertCircle,
                            color: CupertinoColors.systemRed,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.errorMessage ?? 'Failed to load showtimes',
                            style: const TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (state.showtimes.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            lucide.LucideIcons.calendar,
                            color: CupertinoColors.systemGrey,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'No showtimes available',
                            style: TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                final showtimesByDate = _groupShowtimesByDate(state.showtimes);

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final date = showtimesByDate.keys.elementAt(index);
                      final showtimes = showtimesByDate[date]!;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              _formatDateHeader(date),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),

                          ...showtimes.map((showtime) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _ShowtimeCard(showtime: showtime),
                            );
                          }),

                          const SizedBox(height: 16),
                        ],
                      );
                    }, childCount: showtimesByDate.length),
                  ),
                );
              },
            ),

            const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
          ],
        ),
      ),
    );
  }

  Map<String, List<Showtime>> _groupShowtimesByDate(List<Showtime> showtimes) {
    final Map<String, List<Showtime>> grouped = {};

    for (final showtime in showtimes) {
      final date = showtime.date ?? showtime.datetime.split('T')[0];
      if (!grouped.containsKey(date)) {
        grouped[date] = [];
      }
      grouped[date]!.add(showtime);
    }

    return grouped;
  }

  String _formatDateHeader(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final tomorrow = today.add(const Duration(days: 1));
      final dateOnly = DateTime(
        parsedDate.year,
        parsedDate.month,
        parsedDate.day,
      );

      if (dateOnly == today) {
        return 'Today, ${DateFormat('MMM d').format(parsedDate)}';
      } else if (dateOnly == tomorrow) {
        return 'Tomorrow, ${DateFormat('MMM d').format(parsedDate)}';
      } else {
        return DateFormat('EEEE, MMM d').format(parsedDate);
      }
    } catch (e) {
      return date;
    }
  }
}

class _ShowtimeCard extends StatelessWidget {
  final Showtime showtime;

  const _ShowtimeCard({required this.showtime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6
            .resolveFrom(context)
            .withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CupertinoColors.systemGrey5.resolveFrom(context),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  showtime.theaterName ?? 'Theater',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.white,
                  ),
                ),
                const SizedBox(height: 4),

                Row(
                  children: [
                    if (showtime.theaterCity != null) ...[
                      const Icon(
                        lucide.LucideIcons.mapPin,
                        color: CupertinoColors.systemGrey,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        showtime.theaterCity!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                    const Icon(
                      lucide.LucideIcons.monitor,
                      color: CupertinoColors.systemGrey,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Screen ${showtime.screenNumber}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Icon(
                      showtime.availableSeats > 0
                          ? lucide.LucideIcons.checkCircle
                          : lucide.LucideIcons.xCircle,
                      color: showtime.availableSeats > 0
                          ? CupertinoColors.systemGreen
                          : CupertinoColors.systemRed,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${showtime.availableSeats} / ${showtime.totalSeats} seats available',
                      style: const TextStyle(
                        fontSize: 13,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.activeBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  showtime.time ?? _extractTime(showtime.datetime),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${showtime.ticketPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _extractTime(String datetime) {
    try {
      final parsedDateTime = DateTime.parse(datetime);
      return DateFormat('HH:mm').format(parsedDateTime);
    } catch (e) {
      return datetime;
    }
  }
}
