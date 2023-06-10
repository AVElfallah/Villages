import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/router/router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../shared/data/Client/user_auth.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var name = UserAuth.i.name;
    var email = UserAuth.i.email;
    var phone = UserAuth.i.phone;
    return Scaffold(
      appBar: AppBar(
        title: const Text("الملف الشخصى "),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/profile.png',
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: InUseColors.appBarColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Segoe UI',
                            color: InUseColors.componentsColor,
                          ),
                        ),
                        Text(
                          phone == '' ? 'no phone number'.toUpperCase() : phone,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Segoe UI',
                            color: InUseColors.componentsColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    const Icon(
                      FontAwesomeIcons.penToSquare,
                      color: InUseColors.componentsColor,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: 100,
                decoration: BoxDecoration(
                  color: InUseColors.appBarColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Segoe UI',
                        color: InUseColors.componentsColor,
                      ),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Segoe UI',
                        color: InUseColors.componentsColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRouter.editPhoneNum,
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: InUseColors.appBarColor,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: const Text(
                    ' تغيير رقم الهاتف',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Segoe UI',
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /*   Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: 100,
                decoration: BoxDecoration(
                  color: InUseColors.appBarColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      ' العنوان',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Segoe UI',
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .7,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            ' شارع السلام المحلة الكبرى',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Segoe UI',
                              color: InUseColors.hintColor,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            FontAwesomeIcons.penToSquare,
                            color: InUseColors.componentsColor,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
