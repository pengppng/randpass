import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<int> enteredNumbers = [];
  final List<TextEditingController> controllers = List.generate(3, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<int> randomNumbers = args['randomNumbers'];
    final List<int> positions = args['positions'];

    void addNumber(int number) {
      setState(() {
        if (enteredNumbers.length < 3) {
          enteredNumbers.add(number);
        }
        if (enteredNumbers.length == 3) {
          bool isCorrect = true;
          for (int i = 0; i < 3; i++) {
            if (enteredNumbers[i] != randomNumbers[positions[i]]) {
              isCorrect = false;
              break;
            }
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(isCorrect ? 'Correct!' : 'Incorrect, try again.'),
            ),
          );
          enteredNumbers.clear();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your pin',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < enteredNumbers.length ? Colors.black : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  if (index == 9) return SizedBox.shrink(); // ช่องว่าง
                  if (index == 11) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (enteredNumbers.isNotEmpty) {
                            enteredNumbers.removeLast();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Icon(Icons.backspace, color: Colors.white),
                        ),
                      ),
                    );
                  }
                  final displayNumber = index == 10 ? 0 : index + 1;
                  return GestureDetector(
                    onTap: () => addNumber(displayNumber),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          '$displayNumber',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
