import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/news/presentation/manager/news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);
}
