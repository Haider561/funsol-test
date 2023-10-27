import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funsol_test/cognise_model.dart';
import 'package:funsol_test/theme/app_theme.dart';
import 'package:funsol_test/theme/text_style_theme.dart';
import 'package:http/http.dart' as http;
import 'network_Image.dart';

class PromptPage extends StatefulWidget {
  const PromptPage({super.key});

  @override
  State<PromptPage> createState() => _PromptPageState();
}

class _PromptPageState extends State<PromptPage> {

  List<Datum> list=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      initializeComponent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/Cognise.png",width: 80,),
                Image.asset("assets/images/pro.png",width: 60,),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [


                  Container(
                    padding: EdgeInsets.all( 15),
                    decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Text("A painting of a woman with long hair, by Mandy Jurgens, charlie bowater at art style, charlie bowater rich deep colors, trending in art station",style: blackRegularIn16px(),)),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: lightGreyColor,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child:     SvgPicture.asset("assets/images/close.svg",width: 15,),
                            ),

                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: Text("150 / 1000",style: greyRegularIn14px(),)),
                            Image.asset("assets/images/bulbs.png",width: 25,),
                            SizedBox(width: 15,),
                            Image.asset("assets/images/mic.png",width: 25,),
                          ],
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(
                          color: lightGreyColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/add_photo.png",width: 20,),
                            SizedBox(width: 5,),
                            Text("Add Image",style: greyMediumIn14px(),)
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(
                          color: lightGreyColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/frame.png",width: 20,),
                            SizedBox(width: 5,),
                            Text("1:1",style: greyMediumIn14px(),),
                            SizedBox(width: 5,),
                            Icon(Icons.arrow_drop_down,color: Colors.grey,size: 20,)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.all( 15),
                    decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Text("A painting of a woman with long hair, ",style: blackRegularIn16px(),)),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: lightGreyColor,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child:     SvgPicture.asset("assets/images/close.svg",width: 15,),
                            ),

                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: Text("150 / 1000",style: greyRegularIn14px(),)),
                            Image.asset("assets/images/mic.png",width: 25,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Styles",style: blackMediumIn16px(),),
                      Text("See All",style: primaryRegularUnderLineIn14px(),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  (list.isEmpty)?CircularProgressIndicator(color: primaryColor,): SizedBox(
                    height: 100,
                    child: ListView.builder(
                        itemCount: list.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                              width: 100,height:60,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: rectangularNetworkImageFrame(url:"https://mbl.downloadvid.app/${list[index].icon}",
                                      width: 100,height:60,borderRadius: 8.0,borderColor:list[index].isActive? primaryColor:null),

                                ),
                                Center(child: Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.all(primaryColor),
                                  value: list[index].isActive, onChanged: (bool? value) {
                                  list[index].isActive=value!;
                                  setState(() {});
                                },

                                )),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(list[index].name,style: whiteRegularIn12px(),),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.all( 15),
                    decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                       SvgPicture.asset("assets/images/tune.svg",width: 25,),
                        SizedBox(width: 15,),
                        RichText(
                          textAlign: TextAlign.center,
                          text:  TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: 'Advance Settings', style:blackRegularIn16px()),
                              TextSpan(text: '(optional)', style:greyRegularIn14px()),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down,size: 30, color: Colors.grey,)


                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Text("Inspirations",style: blackMediumIn16px(),),
                    ],
                  ),
                 SizedBox(height: 15,),
                  (list.isEmpty)?CircularProgressIndicator(color: primaryColor,):  GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(list.length, (index) {
                    return   rectangularNetworkImageFrame(url: "https://mbl.downloadvid.app/${list[index].icon}",
                        width: 60,height:60,borderRadius: 8.0);
                  },),
                ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

   initializeComponent() async {
   await getServicesMethod();
   setState(() {});
   }

  Future getServicesMethod() async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'GET',
      Uri.parse("https://mbl.downloadvid.app/api/data/"),

    );

    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.headers.addAll(headers);

    var res = await request.send();

    final respStr = await res.stream.bytesToString();
    List<String> values = [];
    print(respStr);
    Map<String, dynamic> map = jsonDecode(respStr);
    if(res.statusCode==200){
     Welcome welcome = Welcome.fromJson(json.decode(respStr));
     list= welcome.data;
     print("jhsfugsffs:${list.length}");

    }

  }
}
