import 'package:field_calculator/main.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Calculations History',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: historyDataList.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ListView.builder(
                itemCount: historyDataList.length,
                itemBuilder: (context, index) {
                  return HistoryCard(
                    data: historyDataList[index],
                    update: update,
                  );
                },
              ),
            )
          : const Center(
              child: Text('You haven\'t made any calculations yet',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
      floatingActionButton: historyDataList.isNotEmpty
          ? FloatingActionButton.extended(
              icon: const Icon(Icons.delete),
              label: const Text(
                'Delete All',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                setState(() {
                  historyDataList.clear();
                });
              })
          : Container(),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final HistoryCardData data;
  final Function update;

  HistoryCard({required this.data, required this.update, super.key});

  Text MyText(String data, bool ifBold) {
    return Text(data,
        style: TextStyle(
            fontSize: 17,
            fontFamily: 'Times',
            fontWeight: ifBold ? FontWeight.bold : FontWeight.normal));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        enableFeedback: true,
        borderRadius: BorderRadius.circular(12),
        splashColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Ink(
            child: Tooltip(
                message: 'Histoy',
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText('Operation: ${data.operation}', false),
                        IconButtonTheme(
                            data: IconButtonThemeData(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Theme.of(context)
                                            .colorScheme
                                            .tertiary))),
                            child: IconButton.filled(
                                onPressed: () {
                                  if (historyDataList.contains(data)) {
                                    historyDataList.remove(data);
                                  }
                                  update();
                                },
                                icon: Icon(Icons.delete)))
                      ],
                    ),
                    const Divider(),
                    if (data.input1.isNotEmpty)
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 24,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            MyText('A: ${data.input1}', false),
                            SizedBox(width: 20),
                            if (data.inputType1.isNotEmpty)
                              MyText(data.inputType1, true),
                          ],
                        ),
                      ),
                    if (data.input2.isNotEmpty)
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 24,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            MyText('B: ${data.input2}', false),
                            SizedBox(width: 20),
                            if (data.inputType2.isNotEmpty)
                              MyText(data.inputType2, true),
                          ],
                        ),
                      ),
                    if (data.input3.isNotEmpty)
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 24,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            MyText('C: ${data.input3}', false),
                            SizedBox(width: 20),
                            if (data.inputType3.isNotEmpty)
                              MyText(data.inputType3, true),
                          ],
                        ),
                      ),
                    const Divider(),
                    if (data.result.isNotEmpty)
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 24,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            MyText('Result: ${data.result}', false),
                            SizedBox(width: 20),
                            if (data.resultType.isNotEmpty)
                              MyText(data.resultType, true),
                          ],
                        ),
                      ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class HistoryCardData {
  final String operation;
  final String input1;
  final String input2;
  final String input3;
  final String inputType1;
  final String inputType2;
  final String inputType3;
  final String result;
  final String resultType;

  HistoryCardData({
    required this.operation,
    required this.input1,
    required this.input2,
    required this.input3,
    required this.inputType1,
    required this.inputType2,
    required this.inputType3,
    required this.result,
    required this.resultType,
  });
}
