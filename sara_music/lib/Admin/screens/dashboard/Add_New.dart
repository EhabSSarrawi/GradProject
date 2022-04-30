import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:toggle_bar/toggle_bar.dart';
import 'dart:io' as file;
import '../../../responsive.dart';
import 'package:path/path.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  String? selectedValue;
  List<String> items = [
    'Violin',
    'Guitar',
    'Piano',
    'Oud',
    'Vioce',   
  ];
  List<String> labels = ["Teacher", "Student" , "Course" ,"Instrument"];
  int currentIndex = 0;
  int value = 0;
  TextEditingController dateinput = TextEditingController();
  TextEditingController PhoneN = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  TextEditingController Date = TextEditingController();
  TextEditingController Gendeer = TextEditingController();

  Widget CustomRadioButton(
      String text, int index, TextEditingController Gendeer) {       
    return OutlineButton(
      hoverColor: Colors.pink,
      onPressed: () {
        Gendeer.text = text;
        setState(() {
          value = index;

          TextFormField(
            controller: Gendeer,
          );
        });
      },
      padding: EdgeInsets.all(15),
      child: Text(
        text,
        style: TextStyle(
          color: (value == index)
              ? Color.fromARGB(255, 12, 51, 113)
              : Colors.black,
          fontWeight:  (value == index)
              ? FontWeight.bold
              : FontWeight.normal,   
          fontSize:  (value == index)?15:14,    
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),     
      borderSide: BorderSide(
          color: (value == index)
              ? Color.fromARGB(255, 12, 51, 113) 
              : Colors.black),
              
    );
  }

  file.File? imagepicker;

  Future getImageFromGallery() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagepicker = file.File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                child: InkWell(
                  child: Image.asset(
                    'images/icons-close.jpg',
                    height: 30,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                child: Text(
                  'Add New',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ToggleBar(
            labels: labels,
            backgroundColor: Color.fromARGB(255, 154, 173, 175),
            selectedTabColor: Color.fromARGB(255, 12, 51, 113),
            onSelectionUpdated: (index) => setState(() => currentIndex = index),
          ),
          SizedBox(
            height: 10,
          ),
         if( currentIndex == 0)
               FadeInDown(
                  delay: Duration(microseconds: 500),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Username",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Email",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 5),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Password",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  cursorColor: Color(0xFFcb1772),
                                  controller: dateinput,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.calendar_today_rounded,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Enter Date",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(3000));

                                    if (pickedDate != null) {
                                      print(pickedDate);
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(formattedDate);

                                      setState(() {
                                        dateinput.text = formattedDate;
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesome.dollar,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Salary",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: double.maxFinite,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: Row(
                                        children: const [
                                          Icon(
                                            Icons.list,
                                            size: 22,
                                            color: Color.fromARGB(
                                                255, 12, 51, 113),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Select Course',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromARGB(
                                                    255, 66, 66, 66),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      items: items
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value as String;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                      ),
                                      iconSize: 14,
                                      iconEnabledColor:
                                          Color.fromARGB(255, 12, 51, 113),
                                      iconDisabledColor: Colors.grey,
                                      buttonHeight: 60,
                                      buttonWidth: 160,
                                      buttonPadding: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      buttonDecoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: Colors.black26,
                                        ),
                                        color:
                                            Color.fromARGB(255, 231, 241, 241),
                                      ),
                                      buttonElevation: 2,
                                      itemHeight: 40,                                    
                                      itemPadding: const EdgeInsets.symmetric(horizontal: 14),
                                      dropdownMaxHeight: 200,
                                      dropdownWidth:390,
                                      dropdownPadding: null,
                                      dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color:
                                            Color.fromARGB(255, 231, 241, 241),
                                      ),
                                      dropdownElevation: 8,
                                      scrollbarRadius:
                                          const Radius.circular(40),
                                      scrollbarThickness: 6,
                                      scrollbarAlwaysShow: true,
                                      offset: const Offset(-20, 0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 75, top: 5),
                                  height: 45,
                                  child: Row(                                  
                                    children: [
                                      CustomRadioButton("Male", 1, Gendeer),
                                      SizedBox(width: 30,),
                                      CustomRadioButton("Female", 2, Gendeer),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Stack(
                                  children: [
                                    InternationalPhoneNumberInput(
                                      inputDecoration: InputDecoration(
                                        prefixIcon: Icon(
                                          FontAwesome.phone,
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                        ),
                                        labelText: "Phone number",
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 4),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 12, 51, 113),
                                              width: 5),
                                        ),
                                      ),
                                      cursorColor:
                                          Color.fromARGB(255, 12, 51, 113),
                                      textFieldController: PhoneN,
                                      onInputChanged: (PhoneNumber number) {
                                        print(number.phoneNumber);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  child: ElevatedButton(
                                    child: Text("ADD"),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(150, 40),
                                      primary: Color.fromARGB(255, 12, 51, 113),
                                      onPrimary: Colors.white,
                                      padding: EdgeInsets.all(10),
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if( currentIndex == 1)
               FadeInDown(
                  delay: Duration(microseconds: 500),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Username",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Email",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 5),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Password",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  cursorColor: Color(0xFFcb1772),
                                  controller: dateinput,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.calendar_today_rounded,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Enter Date",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(3000));

                                    if (pickedDate != null) {
                                      print(pickedDate);
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(formattedDate);

                                      setState(() {
                                        dateinput.text = formattedDate;
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesome.address_book,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Address",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 75, top: 5),
                                  height: 45,
                                  child: Row(                                  
                                    children: [
                                      CustomRadioButton("Male", 1, Gendeer),
                                      SizedBox(width: 30,),
                                      CustomRadioButton("Female", 2, Gendeer),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Stack(
                                  children: [
                                    InternationalPhoneNumberInput(
                                      inputDecoration: InputDecoration(
                                        prefixIcon: Icon(
                                          FontAwesome.phone,
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                        ),
                                        labelText: "Phone number",
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 4),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 12, 51, 113),
                                              width: 5),
                                        ),
                                      ),
                                      cursorColor:
                                          Color.fromARGB(255, 12, 51, 113),
                                      textFieldController: PhoneN,
                                      onInputChanged: (PhoneNumber number) {
                                        print(number.phoneNumber);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  child: ElevatedButton(
                                    child: Text("ADD"),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(150, 40),
                                      primary: Color.fromARGB(255, 12, 51, 113),
                                      onPrimary: Colors.white,
                                      padding: EdgeInsets.all(10),
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if(currentIndex==3) 
              FadeInDown(
                  delay: Duration(microseconds: 500),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesome.music,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Instrument name",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesome.shopping_cart,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Quantity",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesome.dollar,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Price",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    getImageFromGallery();
                                  },
                                  child: TextFormField(
                                    enabled: false,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        FontAwesome.photo,
                                        color: Color.fromARGB(255, 12, 51, 113),
                                      ),
                                      labelText: "Images",
                                      disabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 4),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesome.sticky_note_o,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Description",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  child: ElevatedButton(
                                    child: Text("ADD"),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(150, 40),
                                      primary: Color.fromARGB(255, 12, 51, 113),
                                      onPrimary: Colors.white,
                                      padding: EdgeInsets.all(10),
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if(currentIndex==2)
                 FadeInDown(
                  delay: Duration(microseconds: 500),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesome.music,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Course name",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),                            
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesome.dollar,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Price",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    getImageFromGallery();
                                  },
                                  child: TextFormField(
                                    enabled: false,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        FontAwesome.photo,
                                        color: Color.fromARGB(255, 12, 51, 113),
                                      ),
                                      labelText: "Image",
                                      disabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 4),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      FontAwesome.sticky_note_o,
                                      color: Color.fromARGB(255, 12, 51, 113),
                                    ),
                                    labelText: "Description",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 4),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 12, 51, 113),
                                          width: 5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  child: ElevatedButton(
                                    child: Text("ADD"),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(150, 40),
                                      primary: Color.fromARGB(255, 12, 51, 113),
                                      onPrimary: Colors.white,
                                      padding: EdgeInsets.all(10),
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ]))));
  }
}
