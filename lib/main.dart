import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pizza_theme.dart';

const activeElevatedButtonColor = Colors.blue;
const inactiveElevatedButtonColor = Colors.grey;

void main() {
  runApp(const PizzaAndThemes());
}

class PizzaAndThemes extends StatelessWidget {
  const PizzaAndThemes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myPizzaTheme(),
      home: ThemesInPizza(
      ),
    );
  }
}

class ThemesInPizza extends StatefulWidget {
  const ThemesInPizza({Key? key}) : super(key: key);

  @override
  _ThemesinPizzaState createState() => _ThemesinPizzaState();
}

enum Sauces { hot, sweetSour, cheese }

class _ThemesinPizzaState extends State<ThemesInPizza> {

  bool _checked = true;
  Sauces? _sauces = Sauces.hot;
  void _addCheeseChanged(bool? val) {
    setState(() {
      _checked = !_checked;
    });
  }

  void _sauceChanged(Sauces? value) {
    setState(() {
      _sauces = value;
    });
  }

  var regularTesto = activeElevatedButtonColor;
  var thinTesto = inactiveElevatedButtonColor;
  var selectedTesto;
  int pizzaSize = 35;
  int regularTestoPrice = 100;
  int thinTestoPrice = 80;
  int pizzaPrice=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Собери свою пиццу',
      ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  alignment: Alignment.topRight,
                  child: const SizedBox(
                    width: 232,
                    height: 123,
                    child: Image(
                      image: AssetImage('assets/pizzahot.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 33),
              Text(
                'Калькулятор пиццы',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 9),
              const Text(
                'Выберите параметры:',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(36)),
                  margin: const EdgeInsets.only(left: 18, right: 11),
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedTesto = regularTesto;
                              });
                            },
                            child: const Text('Обычное тесто'),
                            style: ElevatedButton.styleFrom(
                                primary: selectedTesto == regularTesto
                                    ? activeElevatedButtonColor
                                    : inactiveElevatedButtonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(83.0),
                                )),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedTesto = thinTesto;
                              });
                            },
                            child: const Text('Тонкое тесто'),
                            style: ElevatedButton.styleFrom(
                                primary: selectedTesto == thinTesto
                                    ? activeElevatedButtonColor
                                    : inactiveElevatedButtonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(83.0),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              Center(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child:  Text(
                    'Размер:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(36)),
                  margin: const EdgeInsets.only(left: 18, right: 11),
                  child: SliderTheme(
                    data: const SliderThemeData(
                      activeTrackColor: Colors.blue,
                    ),
                    child: Slider(
                      value: pizzaSize.toDouble(),
                      min: 35.0,
                      max: 45.0,
                      divisions: 1,
                      label: '${pizzaSize.round()}',
                      thumbColor: Colors.green,
                      onChanged: (double newValue) {
                        setState(() {
                          pizzaSize = newValue.round();
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              Center(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: const Text(
                        'Соус:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ))),
              RadioListTile<Sauces>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Color(0xFF5DB075),
                  title: Text('Острый'),
                  value: Sauces.hot,
                  groupValue: _sauces,
                  onChanged: _sauceChanged),
              const Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 18,
                endIndent: 9,
              ),
              RadioListTile<Sauces>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Color(0xFF5DB075),
                  title: Text('Кисло-сладкий'),
                  value: Sauces.sweetSour,
                  groupValue: _sauces,
                  onChanged: _sauceChanged),
              const Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 18,
                endIndent: 9,
              ),
              RadioListTile<Sauces>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Color(0xFF5DB075),
                  title: Text('Сырный'),
                  value: Sauces.cheese,
                  groupValue: _sauces,
                  onChanged: _sauceChanged),
              const Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 18,
                endIndent: 9,
              ),
              Container(decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.only(left: 18, right: 11),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex:1, child: Image(image: AssetImage('assets/cheese.png'),)),
                    Expanded(flex:2,child: Text ('Дополнительный сыр', style: TextStyle(fontSize: 16),)),
                    Expanded(flex:1,
                      child: Switch(value: _checked,
                        onChanged: _addCheeseChanged,),
                    )
                  ],
                ),),
              Center(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Стоимость:',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: TextButton(onPressed: (){
                  setState(() {
                    selectedTesto == regularTesto ? pizzaPrice = 100:pizzaPrice=80;
                  });
                },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(36)),
                    margin: EdgeInsets.only(left: 18, right: 11), child:
                  Center(child: Text('${pizzaPrice}  руб.', style: TextStyle(fontSize: 34),)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 154,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Заказать'),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0079D0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      )),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),);
  }
}
