import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:i_student/data/Lecture.dart';

class LecturesList extends StatelessWidget {
  List<Lecture> lectures;
  int offset;
  LecturesList(this.lectures, this.offset);

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController(initialScrollOffset: 370.0*offset);

    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      height: 150.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: lectures.length,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          width: 360,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 5, bottom: 10),
                      child: Text(
                        'Пара от ${lectures[index].strdate} | ${lectures[index].time}',
                        style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 5, top: 5),
                      child: Text(
                        'Преподаватель: ',
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )),
                  Card(
                    color: Theme.of(context).secondaryHeaderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          lectures[index].teacher.length !=0 ? lectures[index].teacher: 'Не указан',
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5, top: 5),
                      child: Text(
                        'Дополнения:',
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )),
                  lectures[index].addictions.length == 0 ?
                  Card(
                    color: Theme.of(context).secondaryHeaderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Дополнений нет...',
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
                  )
                  :
                  Card(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          lectures[index].addictions[0].description,
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
