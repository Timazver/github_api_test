import 'package:flutter/material.dart';
import 'package:github_api_testapp/data/networking/model/responses/commits/commits_response.dart';
import 'package:github_api_testapp/domain/repository/commits_repository_impl.dart';
import 'package:github_api_testapp/messages.dart';
import 'package:github_api_testapp/ui/bloc/commits_screen_bloc.dart';
import 'package:github_api_testapp/ui/components/custom_app_bar.dart';
import 'package:github_api_testapp/ui/custom_styles/custom_colors.dart';
import 'package:github_api_testapp/ui/custom_styles/custom_text_style.dart';

class RepoCommitsScreen extends StatelessWidget {
  final String userName;
  final String repoName;

  var commitsScreenBloc = CommitsScreenListBloc(CommitsRepositoryImpl());

  RepoCommitsScreen({this.userName, this.repoName}) {
    commitsScreenBloc.getRepoCommits(userName, repoName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: repoName),
        body: StreamBuilder(
            stream: commitsScreenBloc.repolistResponse,
            builder: (context, AsyncSnapshot<CommitsResponseList> snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data.commits.length == 0) {
                  return Center(
                      child: Text(Messages.noComits,
                          style: CustomTextStyle(
                            textFontSize: 20,
                            colour: CustomColors.lightGreen,
                          )));
                }
                return ListView.builder(
                  itemCount: snapshot.data.commits.length > 5
                      ? 5
                      : snapshot.data.commits.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            subtitle: Text(
                                snapshot.data.commits[index].commit.message),
                            title: Text(snapshot.data.commits[index].sha),
                            leading: Column(
                              children: <Widget>[
                                CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot
                                        .data.commits[index].author.avatarUrl)),
                                Text(snapshot.data.commits[index].author.login)
                              ],
                            )));
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(Messages.noRepos,
                        style: CustomTextStyle(
                          textFontSize: 20,
                          colour: CustomColors.lightGreen,
                        )));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
