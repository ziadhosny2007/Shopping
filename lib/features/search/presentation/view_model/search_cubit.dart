import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/search/domain/use_case/search_use_case.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.useCase) : super(SearchInitial());
  final SearchUseCase useCase;

  Future<void> search(String name) async {
    emit(SearchLoading());
    final res = await useCase.invoke(name);
    switch (res) {
      case Success():
        emit(SearchSuccess(res.data));
      case Error():
        emit(SearchError(res.error));
    }
  }

  void clearSearch() {
    emit(SearchInitial());
  }
}
