import 'package:github_api_testapp/data/networking/model/responses/commits/commits_response.dart';
import 'package:github_api_testapp/data/repository/commis_repository.dart';
import 'package:rxdart/rxdart.dart';

class CommitsScreenListBloc {
  CommitsRepository repository;

  CommitsScreenListBloc(CommitsRepository repository) {
    this.repository = repository;
  }

  var _repoCommitsStream = PublishSubject<CommitsResponseList>();
  Stream<CommitsResponseList> get repolistResponse => _repoCommitsStream.stream;
  Sink get _addCommitslist => _repoCommitsStream.sink;

  void getRepoCommits(String userName, String repoName) async {
    var response  = await repository.getRepoCommits(userName, repoName);
    if(response != null) {
      _addCommitslist.add(response);
    } else {
      _addCommitslist.add(Error());
    }
  }

  void dispose() {
    _repoCommitsStream.close();
  }
}