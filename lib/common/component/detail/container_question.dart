import 'package:all_of_them/common/component/container_title.dart';
import 'package:all_of_them/common/component/detail/question_model.dart';
import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/data.dart';
import '../../const/text_styles.dart';

class ContainerQuestion extends StatelessWidget {
  const ContainerQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final List<QuestionModel> questions = questionData
        .map((data) => QuestionModel(
              writer: data[0],
              status: data[1],
              question: data[2],
              questionDate: data[3],
              answer: data[4],
              answerDate: data[5],
            ))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ContainerTitle(title: '문의 및 답변'),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemBuilder: (BuildContext context, int index) {
                final question = questions[index];

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: MyColor.lightGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              question.writer,
                              style: MyTextStyle.description14B.copyWith(
                                color: MyColor.text,
                              ),
                            ),
                            Text(
                              question.status,
                              style: MyTextStyle.description14R.copyWith(
                                color: question.status == "답변완료"
                                    ? MyColor.primary
                                    : MyColor.darkGrey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Q. ",
                              style: MyTextStyle.description14R.copyWith(
                                color: MyColor.text,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    question.question,
                                    style: MyTextStyle.description14R.copyWith(
                                      color: MyColor.text,
                                    ),
                                  ),
                                  Text(
                                    question.questionDate,
                                    style: MyTextStyle.caption12R.copyWith(
                                      color: MyColor.darkGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (question.status == "답변완료")
                          const SizedBox(height: 20.0),
                        if (question.status == "답변완료")
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "A. ",
                                style: MyTextStyle.description14R.copyWith(
                                  color: MyColor.text,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      question.answer,
                                      style:
                                          MyTextStyle.description14R.copyWith(
                                        color: MyColor.text,
                                      ),
                                    ),
                                    Text(
                                      question.answerDate,
                                      style: MyTextStyle.caption12R.copyWith(
                                        color: MyColor.darkGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8.0);
              },
              itemCount: questions.length,
            ),
          ),
        ],
      ),
    );
  }
}
