import 'package:flutter/material.dart';
import 'package:github_api_testapp/messages.dart';
import 'package:github_api_testapp/data/networking/model/responses/repos/repolist_response.dart';
import 'package:github_api_testapp/domain/repository/repos/repolist_repository_impl.dart';
import 'package:github_api_testapp/ui/bloc/repolist_bloc.dart';
import 'package:github_api_testapp/ui/components/custom_app_bar.dart';
import 'package:github_api_testapp/ui/custom_styles/custom_colors.dart';
import 'package:github_api_testapp/ui/custom_styles/custom_text_style.dart';
import 'package:github_api_testapp/ui/screens/repo_commits_screen.dart';

class UserRepolistScreen extends StatelessWidget {
  final String userName;

  final repolistBloc = RepolistBloc(RepolistRepositoryImpl());

  UserRepolistScreen({this.userName}) {
    repolistBloc.getUserRepos(userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: Messages.repolistTitle),
        body: StreamBuilder(
            stream: repolistBloc.repolistResponse,
            builder: (context, AsyncSnapshot<RepolistResponse> snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data.repos.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RepoCommitsScreen(
                                        userName: snapshot
                                            .data.repos[index].repoOwner.login,
                                        repoName:
                                            snapshot.data.repos[index].name))),
                            trailing: Text(
                                "Star count:${snapshot.data.repos[index].stargazersCount}"),
                            subtitle:
                                Text(snapshot.data.repos[index].description),
                            title: Text(snapshot.data.repos[index].name),
                            leading: Column(
                              children: <Widget>[
                                CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot.data
                                        .repos[index].repoOwner.avatarUrl)),
                                Text(snapshot.data.repos[index].repoOwner.login)
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
