import 'package:flutter/material.dart';

import '../../../utils/constants/assets_constants.dart';

class DoctorContainer extends StatelessWidget {
  const DoctorContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: size.width * 0.42,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    ImageConstants.doctor,
                    height: size.height * 0.15,
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Muhammed Melih Gündoğandasdsacasd',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text('Alanı: Ortodonti',
                            style:
                                TextStyle(color: Colors.black, fontSize: 10)),
                        SizedBox(
                          height: size.height * 0.003,
                        ),
                        Text('Tecrübesi: 9 Yıl',
                            style:
                                TextStyle(color: Colors.black, fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}