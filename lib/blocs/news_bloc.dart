import 'dart:async';
import '../networking/response.dart';
import '../response/news_response.dart';
import '../models/news_model.dart';

class NewsBloc {

  NewsRepository _newsRepository;
  StreamController _newskDataController;
  bool _isStreaming;


  StreamSink<Response<NewsResponse>> get newkDataSink =>
      _newskDataController.sink;

  Stream<Response<NewsResponse>> get newkDataStream =>
      _newskDataController.stream;

  NewsBloc() {
    _newskDataController = StreamController<Response<NewsResponse>>();
    _newsRepository = NewsRepository();
    _isStreaming = true;
    fetchData();
  }

  fetchData() async {
    newkDataSink.add(Response.loading('Getting a Chucky joke!'));
    try {
      NewsResponse chuckJoke = await _newsRepository.fetchProducts();
      if (_isStreaming) newkDataSink.add(Response.completed(chuckJoke));
    } catch (e) {
      if (_isStreaming) newkDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _isStreaming = false;
    _newskDataController?.close();
  }
}
