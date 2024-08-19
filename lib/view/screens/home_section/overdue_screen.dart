
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../../model/all_task_model.dart';
import '../../custom_widget/custom_main_button.dart';
import '../../custom_widget/custom_textfield_screen.dart';
class OverdueScreen extends StatefulWidget {
  const OverdueScreen({Key? key}) : super(key: key);

  @override
  State<OverdueScreen> createState() => _OverdueScreenState();
}

class _OverdueScreenState extends State<OverdueScreen> {
  List<AllTaskModel> data=[
    AllTaskModel(topicName: 'New upcoming topic', date: '10/07/2024', description: 'Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing i Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae.',
        name: 'Zeeshan', subtitle: 'abc@xyz.com', remarks: 'Need to Work', imageUrl: 'assets/png/notificationProfile.png'),
    AllTaskModel(topicName: 'New upcoming topic', date: '10/07/2024', description: 'Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing i Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae.',
        name: 'Umer', subtitle: 'abc@xyz.com', remarks: 'Satisfactory', imageUrl: 'assets/png/notificationProfile.png'),
    AllTaskModel(topicName: 'New upcoming topic', date: '10/07/2024', description: 'Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing i Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae.',
        name: 'Rashid', subtitle: 'abc@xyz.com', remarks: 'Not Approved', imageUrl: 'assets/png/notificationProfile.png'),
    AllTaskModel(topicName: 'New upcoming topic', date: '10/07/2024', description: 'Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing i Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae.',
        name: 'Usman', subtitle: 'abc@xyz.com', remarks: 'Overdue', imageUrl: 'assets/png/notificationProfile.png'),
    AllTaskModel(topicName: 'New upcoming topic', date: '10/07/2024', description: 'Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing i Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae.',
        name: 'Bilal', subtitle: 'abc@xyz.com', remarks: 'Not Approved', imageUrl: 'assets/png/notificationProfile.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(onTap:  () {
              Get.back();
            },
                child: Icon(Icons.arrow_back_ios_new,color: MyColor.blueColor,)),
            Text("Overdue",style:Constant.textTask,),
            SizedBox(height:10,width: 10,)
          ],
        ),),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          CustomSearchTextField(hintText: 'Search Task', hintStyle: Constant.textGreySign,),
          Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding:  const EdgeInsets.all(12),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: MyColor.backgroundColor),
                    child:  Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data[index].topicName,style:Constant.textTotalMatrices),
                            Text(data[index].date,style:Constant.textTotalMatrices),
                          ],
                        ),
                        Text(data[index].description,
                            style: Constant.textDescription),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(backgroundImage: AssetImage((data[index].imageUrl)),),
                            getHorizontal(1.w),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Text(data[index].name,style:Constant.textTotalMatrices),
                                  Text(data[index].subtitle, style: Constant.textDescription),
                                ],
                              ),
                            ),
                            // Expanded(child: SizedBox()),
                            // Text(data[index].remarks,style:Constant.textTotalMatrices)
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],),
      ),
    );
  }
}
