import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inu/view/screens/home_section/satisfactory_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../../model/home_model.dart';
import '../../custom_widget/custom_main_button.dart';
import 'all_task_screen.dart';
import 'approved_screen.dart';
import 'need _to_work_screen.dart';
import 'not_approved_screen.dart';
import 'overdue_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<HomeModel> data=[
      HomeModel(imageUrl: "assets/png/need to work.png", text: "Need to Work"),
      HomeModel(imageUrl: "assets/png/notApproved.png", text: "Not Approved"),
      HomeModel(imageUrl: "assets/png/satisfactory.png", text: "Satisfactory"),
      HomeModel(imageUrl: "assets/png/approved.png", text: "Approved"),
      HomeModel(imageUrl: "assets/png/overview.png", text: "Overview"),
      HomeModel(imageUrl: "assets/png/allApp.png", text: "All"),
    ];
    List<Widget>screens=[
      const NeedToWorkScreen(),
      const NotApprovedScreen(),
      const SatisfactoryScreen(),
      const ApprovedScreen(),
      const OverdueScreen(),
      const AllTaskScreen(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [getVertical(1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/png/notificationApp1.png",
                      height: 25,
                      width: 25,
                    ),
                    const CircleAvatar(
                      backgroundImage:
                      AssetImage("assets/png/notificationProfile.png"),
                      radius: 20,
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Center(
                  child: Image.asset(
                    "assets/png/inu_transparent.png",
                    color: MyColor.blueColor,

                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,// Define a specific height for the GridView
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 1.w,
                      mainAxisSpacing: 2.h,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(onTap: () {
                        Get.to(()=>screens[index]);
                      },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 0.5.w,horizontal: .5.w),
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.black.withOpacity(0.15)),
                          ),
                          child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(data[index].imageUrl,height: 100.px,width: 100.px,),
                              Text(
                                data[index].text,
                                style: Constant.textCoordinateName,
                                textAlign: TextAlign.center,
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
