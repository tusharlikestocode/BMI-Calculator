import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result=0;
Color myColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Check Your BMI Here',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 24,

              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height in cms',
                icon: Icon(Icons.height),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight in kgs',
                icon: Icon(Icons.monitor_weight),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(

              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: calculateBMI,
            ),
            SizedBox(height: 20),
            Center(
              child:Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: myColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))

                ),
                child:  Center(
                  child:  Text(
                    _result == null ? "Enter Value" : "BMI: ${_result.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ),
            ),
            SizedBox(height: 30,),
            Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF87B1D9),
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))


                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Underweight'),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFF3DD365),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))


                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Normal'),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFFEEE133),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))


                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Overweight'),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFFFD802E),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))


                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Obese'),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFFF95353),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))


                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Extreme'),
                ],
              )
            ],) ,)



          ],
        ),
      ),
    );
  }
  
  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    
    setState(() {
      _result = result;
      if(result<18.5){
        myColor=Color(0xFF87B1D9);
        
      }
      else if(result>=18.5 && result<=24.9){
        myColor=Color(0xFF3DD365);
      }
      else if(result>=25 && result<=29.9){
        myColor=Color(0xFFEEE133);
      }
      else if(result>=30 && result<=34.9){
        myColor=Color(0xFFFD802E);
      }
      else if(result>=35){
        myColor=Color(0xFFF95353);
      }
    });
  }
}
