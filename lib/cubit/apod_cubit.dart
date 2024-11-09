import 'package:bloc/bloc.dart';
import 'package:image_loader/cubit/apod_state.dart';
import 'package:image_loader/models/apod_model.dart';
import 'package:image_loader/services/nasa_api_client.dart';

class ApodCubit extends Cubit<ApodState> {
  final NasaApiClient apiClient;

  ApodCubit(this.apiClient) : super(ApodInitial());

  Future<void> fetchApod() async {
    emit(ApodLoading());
    try {
      final data = await apiClient.fetchApod();
      final apodData = ApodModel.fromJson(data);
      emit(ApodSuccess(apodData));
    } catch (e) {
      emit(ApodError('Failed to fetch picture: ${e.toString()}'));
    }
  }
}
