import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spaciko/Home/Ui/Comment/SpecialOffer.dart';
import 'package:spaciko/widgets/Pelette.dart';

import 'Widget/Bubble.dart';

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextStyle textStyle = TextStyle(color: Colors.white);
  List<String> temp = List<String>();
  String msg;
  TextEditingController _controller = TextEditingController();

  List<String> _stepText = ['1','2','3','4','5','6'];
  var activeColor = AppColors.colorPrimaryDark;
  var inActiveColor = AppColors.colorGreenTrans;
  int _curStep =0;
  bool title = false;
  bool btn = true;

  @override
  void initState() {
    super.initState();
    temp.add('Hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: AppColors.colorPrimaryDark,
          child: Column(
            children: [
              Container(padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
                  alignment: Alignment.centerLeft,
                  color: AppColors.colorPrimaryDark,
                  height: MediaQuery.of(context).size.height * 0.14,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),
                        onTap: (){
                          title = false;
                          btn = true;
                          setState(() {
                           _curStep =0;
                          });
                          print(_curStep);
                        },
                      ),
                      Visibility(
                        visible: title,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Spacial Offer',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,
                          fontFamily: 'poppins_semibold',fontSize: 20),),
                        ),
                      ),
                      Visibility(
                        visible: btn,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              title = true;
                              btn = false;
                              _curStep =1;
                            });
                            print(_curStep);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 110,
                            decoration: BoxDecoration(
                              color: AppColors.colorPink,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text('Spacial Offer',style:
                            TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'poppins_semibold'),textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ],
                  )
              ),

              Expanded(
                child:_curStep==0?Container(
                  decoration: BoxDecoration(
                    color: AppColors.colorLightBlue50,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                     _chat(),
                      Column(
                        children: [
                          Container(
                            margin:const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            color:Colors.white,
                            child: Text('Translate this conversation to english powered by google',textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black87,fontSize: 17,fontFamily: 'poppins_regular'),),
                          ),
                          Stack(
                            children: [
                              Container(margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black54)
                                ),
                                child: Form(
                                  child: TextFormField(
                                    onChanged: (String val){
                                      msg = val;
                                    },
                                    controller: _controller,
                                    decoration: InputDecoration(
                                      focusColor: Colors.black,
                                        enabledBorder: InputBorder.none,
                                        contentPadding: const EdgeInsets.fromLTRB(
                                            20, 0, 50, 0),
                                       border: InputBorder.none,
                                      hintText: 'Type message...',
                                      hintStyle: TextStyle(fontSize: 18)
                                    ),
                                  ),
                                ),
                              ),
                              Container(padding: const EdgeInsets.only(right: 15),
                                height: 50,
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  child:Image(
                                    height: 40,
                                    width: 40,
                                    image: AssetImage('image/ic_send_msg.png'),
                                  ),
                                  onTap: (){
                                   setState(() {
                                       temp.add(msg);
                                       _controller.text ="";
                                   });
                                  },
                                )
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ):SpacialOffer()
              )
            ],
          ),
        )
    );
  }

  Widget _chat() {
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: temp.length,
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Bubble(isMe: true,message: temp[index]),
                Bubble(isMe: false,message: temp[index].split('').reversed.join(),)
              ],
            ),
          );
        },
      ),
    );
  }
}
