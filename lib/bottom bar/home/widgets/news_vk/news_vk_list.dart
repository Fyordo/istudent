import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/mmcs_news/mmcs_news_bloc.dart';
import '../../bloc/vk_news/vk_news_bloc.dart';

class NewsVkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsVkBloc>(
      create: (context) {
        return NewsVkBloc(NewsVkStateWithoutNews())
          ..add(NewsVkEventWithNews());
      },
      child: BlocConsumer<NewsVkBloc, NewsVkState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is NewsVkStateWithNews) {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: ListView.separated(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 5,

                  itemBuilder: (BuildContext context, int index) => ListTile(title: Text(
                      state.news_vk[index].text != "" ? state.news_vk[index].text.substring(0, min(55, state.news_vk[index].text.length)) + "..." : "<новость не содержит текст> "
                  ), trailing: Icon(Icons.chevron_right_rounded),),
                  separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Theme.of(context).hintColor,),
                ));
          }
          else if (state is NewsVkStateWithoutNews) {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: ListView.separated(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 5,

                  itemBuilder: (BuildContext context, int index) => ListTile(title: Text("Мехмат объявлен лучшим вузом страны"), trailing: Icon(Icons.chevron_right_rounded),),
                  separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Theme.of(context).hintColor,),
                ));
          }
          else return Text("Error");
        },
      ),
    );
    
  }
}
