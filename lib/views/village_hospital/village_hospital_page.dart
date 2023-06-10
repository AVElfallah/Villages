import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/assets.dart';
import 'package:villages/assets/colors.dart';
import 'package:villages/shared/data/hospital_sp.dart';
import 'package:villages/views/village_hospital/components/hospital_card.dart';
import 'package:villages/views/village_hospital/components/hospital_clinic_card.dart';

import '../../controller/hospital/hospita_page_controller.dart';
import '../../shared/data/hospital_doctor.dart';
import '../../shared/views/layouts/hospital_doctors_preview/hospital_doctors_preview_page.dart';

class VillageHospitalPage extends StatefulWidget {
  const VillageHospitalPage({Key? key}) : super(key: key);

  @override
  State<VillageHospitalPage> createState() => _VillageHospitalPageState();
}

class _VillageHospitalPageState extends State<VillageHospitalPage> {
  late final TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HospitalPageController>(
      create: (_) => HospitalPageController(),
      builder: (context, _) {
        final watch = context.watch<HospitalPageController>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('مستشفي رأس الخليج البلد'),
            centerTitle: true,
          ),
          body: watch.clincs.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: textEditingController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.end,
                        decoration: const InputDecoration(
                          fillColor: InUseColors.appBarColor,
                          hintTextDirection: TextDirection.ltr,
                          filled: true,
                          hintText: 'البحث عن التخصص',
                          suffixIcon: Icon(
                            Icons.search,
                            color: InUseColors.componentsColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'التخصصات المتاحة',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: InUseColors.componentsColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Divider(
                      color: InUseColors.componentsColor,
                      thickness: 1.5,
                      indent: 65.w,
                      endIndent: 4.w,
                    ),
                    SizedBox(
                      height: 130.h,
                      child: GridView.builder(
                        itemCount: watch.clincs.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .96,
                        ),
                        itemBuilder: (_, iTo) => HospitalClinicCard(
                          clinic: watch.clincs[iTo],
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
