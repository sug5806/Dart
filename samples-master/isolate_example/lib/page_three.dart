// Copyright 2019-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataTransferPageStarter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => DataTransferIsolateController(),
      child: DataTransferPage(),
    );
  }
}

class DataTransferPage extends StatelessWidget {
  @override
  Widget build(context) {
    final controller = Provider.of<DataTransferIsolateController>(context);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Text(
              'Number Generator Progress',
              style: Theme.of(context).textTheme.title,
            ),
            padding: EdgeInsets.all(8),
          ),
          LinearProgressIndicator(
            value: controller.progressPercent,
            backgroundColor: Colors.grey[200],
          ),
          Expanded(
            child: RunningList(),
          ),
          Column(
            children: [
              RaisedButton(
                child: const Text('Transfer Data to 2nd Isolate'),
                color: (controller.runningTest == 1)
                    ? Colors.blueAccent
                    : Colors.grey[300],
                onPressed: () => controller.generateRandomNumbers(false),
              ),
              RaisedButton(
                child: const Text('Transfer Data with TransferableTypedData'),
                color: (controller.runningTest == 2)
                    ? Colors.blueAccent
                    : Colors.grey[300],
                onPressed: () => controller.generateRandomNumbers(true),
              ),
              RaisedButton(
                child: const Text('Generate on 2nd Isolate'),
                color: (controller.runningTest == 3)
                    ? Colors.blueAccent
                    : Colors.grey[300],
                onPressed: controller.generateOnSecondaryIsolate,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DataTransferIsolateController extends ChangeNotifier {
  Isolate _isolate;
  ReceivePort _incomingReceivePort;
  SendPort _outgoingSendPort;

  final currentProgress = <String>[];
  int runningTest = 0;
  Stopwatch _timer = Stopwatch();
  double progressPercent = 0;

  Isolate get newIsolate => _isolate;

  bool get running => runningTest != 0;

  DataTransferIsolateController() {
    createIsolate();
    listen();
  }

  Future<void> createIsolate() async {
    _incomingReceivePort = ReceivePort();
    _isolate = await Isolate.spawn(
        _secondIsolateEntryPoint, _incomingReceivePort.sendPort);
  }

  void listen() {
    _incomingReceivePort.listen((dynamic message) {
      if (message is SendPort) {
        _outgoingSendPort = message;
      }

      if (message is int) {
        currentProgress.insert(
            0, '$message% - ${_timer.elapsedMilliseconds / 1000} seconds');
        progressPercent = message / 100;
      }

      if (message is String && message == 'done') {
        runningTest = 0;
        _timer.stop();
      }

      notifyListeners();
    });
  }

  void generateOnSecondaryIsolate() {
    if (running) return;
    runningTest = 3;
    currentProgress.clear();

    _timer = Stopwatch();
    _timer.start();
    _outgoingSendPort.send('start');

    notifyListeners();
  }

  Future<void> generateRandomNumbers(bool transferableTyped) async {
    if (running) return;

    if (transferableTyped) {
      runningTest = 2;
    } else {
      runningTest = 1;
    }

    Random rng = Random();

    currentProgress.clear();

    _timer.reset();
    _timer.start();

    List<int> randNums = [];
    for (int i = 0; i < 100; i++) {
      randNums.clear();

      for (int j = 0; j < 1000000; j++) {
        randNums.add(rng.nextInt(100));
      }

      if (transferableTyped) {
        final transferable =
            TransferableTypedData.fromList([Int32List.fromList(randNums)]);
        await sendNumbers(transferable);
      } else {
        await sendNumbers(randNums);
      }
    }
  }

  Future<void> sendNumbers(dynamic numList) async {
    return Future<void>(() {
      _outgoingSendPort.send(numList);
    });
  }

  void dispose() {
    super.dispose();
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
  }
}

class RunningList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final progress =
        Provider.of<DataTransferIsolateController>(context).currentProgress;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: ListView.builder(
        itemCount: progress.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                child: ListTile(
                  title: Text(progress[index]),
                ),
                color: Colors.lightGreenAccent,
              ),
              Divider(
                color: Colors.blue,
                height: 3,
              ),
            ],
          );
        },
      ),
    );
  }
}

Future<void> _secondIsolateEntryPoint(SendPort callerSP) async {
  ReceivePort newIceRP = ReceivePort();
  callerSP.send(newIceRP.sendPort);
  int length = 1;

  newIceRP.listen(
    (dynamic message) async {
      if (message is String && message == 'start') {
        await generateAndSum(callerSP, createNums(), length);

        callerSP.send('done');
      } else if (message is TransferableTypedData) {
        await generateAndSum(
            callerSP, message.materialize().asInt32List(), length);
        length++;
      } else if (message is List<int>) {
        await generateAndSum(callerSP, message, length);
        length++;
      }

      if (length == 101) {
        callerSP.send('done');
        length = 1;
      }
    },
  );
}

Iterable<int> createNums() sync* {
  final rng = Random();
  for (int i = 0; i < 100000000; i++) {
    yield rng.nextInt(100);
  }
}

Future<void> generateAndSum(
  SendPort callerSP,
  Iterable<int> iter,
  int length,
) async {
  int sum = 0;
  int count = 1;

  for (int x in iter) {
    sum += x;
    if (count % 1000000 == 0) {
      callerSP.send((count ~/ 1000000) * length);
    }
    count++;
  }

  return sum;
}
