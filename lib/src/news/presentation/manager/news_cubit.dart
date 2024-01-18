import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/news/presentation/manager/news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  // Properties
  int currentScreenId = 0;

  // Class Related Methods
  NewsCubit() : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);

  // Public use methods
  void changeCurrentScreenId(int id) {
    currentScreenId = id;
    emit(BottomNavigationBarStateChangedState());
  }
}
