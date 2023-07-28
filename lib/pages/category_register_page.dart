import 'package:flutter/material.dart';
import 'package:awesome_select/awesome_select.dart';


class CategoryRegisterPage extends StatefulWidget {
  const CategoryRegisterPage({Key? key}) : super(key: key);

  @override
  _CategoryRegisterPageState createState() => _CategoryRegisterPageState();
}

class _CategoryRegisterPageState extends State<CategoryRegisterPage> {
  int? _value = 1;
  List<String> category = ['가구/인테리어', '패션', '생활가전', '게임', '취미', '스포츠/레져', '식물', '생활/주방', '악세사리',
    '반려동물용품', '교육', '육아', '운동/건강'];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height*0.1,
          ),
          Center(child: Image.asset('assets/category_register_page/main_title.png')),
          Wrap(
            spacing: 5.0,
            children: List<Widget>.generate(
              3,
                  (int index) {
                return ChoiceChip(
                  label: Text('$category'),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),

    );
  }

  chipList() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: <Widget>[
        _buildChip('Gamer', Color(0xFFff6666)),
        _buildChip('Hacker', Color(0xFF007f5c)),
        _buildChip('Developer', Color(0xFF5f65d3)),
        _buildChip('Racer', Color(0xFF19ca21)),
        _buildChip('Traveller', Color(0xFF60230b)),
      ],
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }
}

