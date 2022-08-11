import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../../utils/constants/assets_constants.dart';
import '../../utils/constants/colors_constants.dart';

class MyDoctorsView extends StatelessWidget {
  const MyDoctorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConstans.customGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: themeData.primaryColor,
            )),
        title: 
            Text(
              'Doktorlarımız',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: themeData.primaryColor),
            ),
      
        
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.005,
          ),Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.01),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: size.height * 0.115,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.0175),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                ImageConstants.doctor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Dr. Muhammed Melih Gündoğan',
                                  style: TextStyle(
                                      color: themeData.primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text('Specialists',
                                    style: TextStyle(
                                        color: themeData.primaryColor,
                                        fontSize: 8)),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                    ),
                                    Text('Clinic Name',
                                        style: TextStyle(
                                            color: themeData.primaryColor,
                                            fontSize: 8)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}