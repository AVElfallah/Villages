//SECTION -  Api Constants
//NOTE - This is the file where all the constants related to the API are stored

const String backEndURL = "http://10.0.2.2:8000/api";
const String loginAPI = '$backEndURL/login';

const String registerAPI = '$backEndURL/register';

const String forgetPasswordAPI = '$backEndURL/password/forget';

const String resetPasswordAPI = '$backEndURL/password/reset';

const String checkOtpAPI = '$backEndURL/password/checkotp';

const String changePasswordAPI = "$backEndURL/profile/change-password";

const String changePhoneAPI = "$backEndURL/profile/change-phone";

const String getAllSchoolsAPI = "$backEndURL/allschools/";

const String fetchSchoolTeachersAPI = "$backEndURL/showschool/";

const String clubAPI = "$backEndURL/club/";

const String shopAPI = "$backEndURL/shops/";

const String jobCategoriesAPI = "$backEndURL/allworks/";

const String workersAPI = "$backEndURL/showworks/";

const String fetchVillageAPI = "$backEndURL/village/";

const String fetchServicesAPI = "$backEndURL/serv?";

const String getAllHospitalClincAPI = "$backEndURL/clinics/";

const String getAllDoctorsInPraviteClinicAPI = "$backEndURL/clinicdoctore";

const String getTheTopRatedServicesAPI = "$backEndURL/getRated";

String getDoctorsINClincHospitalAPI(int clicID) =>
    "$backEndURL/clinics/$clicID";

String rateWorkerAPI(int workerID, double rate) =>
    "$backEndURL/rateworker/$workerID/rate?rate=$rate";
String rateTeacherAPI(int teacherID, double rate) =>
    "$backEndURL/rateteacher/$teacherID/rate?rate=$rate";
String rateHospitalDoctorAPI(int teacherID, double rate) =>
    "$backEndURL/ratehospitaldoctore/$teacherID/rate?rate=$rate";
String rateClincDoctorAPI(int teacherID, double rate) =>
    "$backEndURL/rateclinicdoctor/$teacherID/rate?rate=$rate";
String rateShopsAPI(int teacherID, double rate) =>
    "$backEndURL/rateshop/$teacherID/rate?rate=$rate";

//SECTION - App String Constants

const String authContainerTag = 'auth_container';

const String hospitalString = 'مستشفيات';

const String schoolString = 'مدارس';

const String factoiesString = "مصانع";

const String jobsAndCraftString = "مهن وحرف";

const String clinicsString = "عيادات خصوصية";

const String emrgancyString = "الاسعاف والطوارئ";

const List<String> arWeakDayes = [
  'السبت',
  'الاحد',
  "الاثنين",
  "الثلاثاء",
  "الاربعاء",
  'الخميس',
  "الجمعه",
];

getDayNowName() {
  var now = DateTime.now().weekday;
  return arWeakDayes[now];
}

getDayTomorrowName() {
  var now = DateTime.now().weekday;

  return arWeakDayes[now + 1 < 7 ? now + 1 : 0];
}
