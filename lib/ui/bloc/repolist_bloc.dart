import 'dart:async';
import 'package:github_api_testapp/messages.dart';
import 'package:github_api_testapp/data/networking/model/responses/repos/repolist_response.dart';
import 'package:github_api_testapp/data/repository/repos/repolist_repository.dart';
import 'package:rxdart/rxdart.dart';

class RepolistBloc {
  RepolistRepository repository;

  RepolistBloc(RepolistRepository repository) {
    this.repository = repository;
    // getUserRepos(userName);
  }

  var _repolistStream = BehaviorSubject<RepolistResponse>();
  Stream<RepolistResponse> get repolistResponse => _repolistStream.stream;
  Sink get _addRepolist => _repolistStream.sink;

  void getUserRepos(String userName) async {
    // var response  = await repository.getUserRepos(userName);
   repository.getUserRepos(userName).then((value) {
     _addRepolist.add(value);
   })
   .catchError((error) {
     _repolistStream.sink.addError(Messages.noRepos);
   });
  }

  void dispose() {
    _repolistStream.close();
  }
}