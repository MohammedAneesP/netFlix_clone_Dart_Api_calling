part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isLoading,
    List<Downloads>? downloads,
    required Option<Either<MainFailure,List<Downloads>>> downloadFailureOrSuccessOption,
  }) = _DownloadsState;

  factory DownloadsState.inital() {
    return const DownloadsState(
      isLoading: false,
      downloadFailureOrSuccessOption: None(),
    );
  }
}
