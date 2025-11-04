import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import '../../../../core/data/api_client.dart';
import '../../../../core/utils/toast_utils.dart';
import '../../../movies/domain/entities/movie.dart';
import '../../data/datasources/bookings_api.dart';
import '../../data/repositories/bookings_repository.dart';
import '../../domain/usecases/get_seat_map_usecase.dart';
import '../../domain/usecases/reserve_seats_usecase.dart';
import '../viewmodels/seat_selection_bloc.dart';
import '../viewmodels/seat_selection_event.dart';
import '../viewmodels/seat_selection_state.dart';
import '../widgets/seat_grid_widget.dart';
import '../widgets/seat_legend_widget.dart';

class SeatSelectionPage extends StatelessWidget {
  final Showtime showtime;

  const SeatSelectionPage({
    super.key,
    required this.showtime,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final repository = BookingsRepository(
          BookingsApi(ApiClient.instance),
        );
        return SeatSelectionBloc(
          getSeatMapUseCase: GetSeatMapUseCase(repository),
          reserveSeatsUseCase: ReserveSeatsUseCase(repository),
          baseTicketPrice: showtime.ticketPrice,
        )..add(SeatSelectionEvent.started(showtime.id));
      },
      child: _SeatSelectionView(showtime: showtime),
    );
  }
}

class _SeatSelectionView extends StatelessWidget {
  final Showtime showtime;

  const _SeatSelectionView({required this.showtime});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SeatSelectionBloc, SeatSelectionState>(
      listener: (context, state) {
        // Show errors
        if (state.status == SeatSelectionStatus.failure &&
            state.errorMessage != null) {
          ToastUtils.showError(
            context,
            title: 'Error',
            description: state.errorMessage,
          );
        }

        // Navigate to booking confirmation on successful reservation
        if (state.status == SeatSelectionStatus.reserved &&
            state.reservationResult != null) {
          ToastUtils.showSuccess(
            context,
            title: 'Seats Reserved',
            description: state.reservationResult!.message,
          );

          // TODO: Navigate to booking confirmation page
          // For now, just go back
          context.pop();
        }
      },
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
        navigationBar: CupertinoNavigationBar(
          backgroundColor:
              CupertinoColors.systemBackground.resolveFrom(context),
          border: null,
          middle: const Text(
            'Select Seats',
            style: TextStyle(
              color: CupertinoColors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              context
                  .read<SeatSelectionBloc>()
                  .add(const SeatSelectionEvent.refreshSeatMap());
            },
            child: const Icon(
              lucide.LucideIcons.refreshCw,
              size: 24,
              color: CupertinoColors.white,
            ),
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<SeatSelectionBloc, SeatSelectionState>(
            builder: (context, state) {
              if (state.status == SeatSelectionStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(radius: 15),
                );
              }

              if (state.status == SeatSelectionStatus.failure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        lucide.LucideIcons.alertCircle,
                        size: 48,
                        color: CupertinoColors.systemRed,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Failed to load seats',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.label.resolveFrom(context),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.errorMessage ?? 'Unknown error',
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              CupertinoColors.secondaryLabel.resolveFrom(context),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      CupertinoButton.filled(
                        onPressed: () {
                          context
                              .read<SeatSelectionBloc>()
                              .add(SeatSelectionEvent.started(showtime.id));
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              if (state.seatMap == null) {
                return const Center(
                  child: Text('No seat map available'),
                );
              }

              return Column(
                children: [
                  // Theater Info
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6
                          .resolveFrom(context)
                          .withOpacity(0.3),
                      border: Border(
                        bottom: BorderSide(
                          color: CupertinoColors.systemGrey5.resolveFrom(context),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          showtime.movieTitle ?? 'Movie',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.label.resolveFrom(context),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${showtime.theaterName ?? "Theater"} - Screen ${showtime.screenNumber}',
                          style: TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.secondaryLabel
                                .resolveFrom(context),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${showtime.date ?? ""} ${showtime.time ?? ""}',
                          style: TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.secondaryLabel
                                .resolveFrom(context),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Seat Grid
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          // Screen indicator
                          Container(
                            width: 200,
                            height: 4,
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemGrey,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'SCREEN',
                            style: TextStyle(
                              fontSize: 12,
                              color: CupertinoColors.secondaryLabel
                                  .resolveFrom(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Seat grid
                          SeatGridWidget(
                            seatMap: state.seatMap!,
                            selectedSeatIds: state.selectedSeatIds,
                            onSeatTap: (seatId) {
                              context.read<SeatSelectionBloc>().add(
                                    SeatSelectionEvent.seatToggled(seatId),
                                  );
                            },
                          ),
                          const SizedBox(height: 24),
                          // Legend
                          const SeatLegendWidget(),
                          const SizedBox(height: 100), // Space for bottom bar
                        ],
                      ),
                    ),
                  ),

                  // Bottom action bar
                  _BottomActionBar(
                    selectedCount: state.selectedCount,
                    totalPrice: state.totalPrice,
                    isReserving: state.status == SeatSelectionStatus.reserving,
                    hasSelectedSeats: state.hasSelectedSeats,
                    onProceed: () {
                      context
                          .read<SeatSelectionBloc>()
                          .add(const SeatSelectionEvent.reserveSeats());
                    },
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

class _BottomActionBar extends StatelessWidget {
  final int selectedCount;
  final double totalPrice;
  final bool isReserving;
  final bool hasSelectedSeats;
  final VoidCallback onProceed;

  const _BottomActionBar({
    required this.selectedCount,
    required this.totalPrice,
    required this.isReserving,
    required this.hasSelectedSeats,
    required this.onProceed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground.resolveFrom(context),
        border: Border(
          top: BorderSide(
            color: CupertinoColors.systemGrey5.resolveFrom(context),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasSelectedSeats) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$selectedCount ${selectedCount == 1 ? "seat" : "seats"} selected',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.label.resolveFrom(context),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.systemRed,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 140,
                    child: CupertinoButton(
                      color: CupertinoColors.systemRed,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      onPressed: isReserving ? null : onProceed,
                      child: isReserving
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CupertinoActivityIndicator(
                                color: CupertinoColors.white,
                              ),
                            )
                          : const Text(
                              'Proceed',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ] else ...[
              Text(
                'Select seats to continue',
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
