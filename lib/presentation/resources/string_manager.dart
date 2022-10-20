class StringManger {
  static late int langIndex;

  static set setLanguage(int themeIndex) {
    langIndex = themeIndex;
  }

  static const empty = "";

  // application info
  static String get appName => ["Gate Counter", "بوابه العد"][langIndex];
  static String get about => ["About App", "عن التطبيق"][langIndex];
  static String get version => ["Version 1.0.0", "الإصدار 1.0.0"][langIndex];
  static String get poweredBy => ["Powered By", "مبرمج بواسطة"][langIndex];
  static String get copyRights => [
        "copyright © 2022 all rights reserved",
        "حقوق النشر © 2022 جميع الحقوق محفوظة"
      ][langIndex];
  static String get description => [
        "Software to Count stock items in smart and easy  way.",
        "برنامج للتحكم في نظام خروج البضائع الخاص بك."
      ][langIndex];

  // drawer
  static String get home => ["Home", "الرئيسية"][langIndex];
  static String get records => ["Records", "السجلات"][langIndex];
  static String get materials => ["Materials", "المواد"][langIndex];
  static String get reports => ["Reports", "التقارير"][langIndex];
  static String get settings => ["Settings", "الإعدادات"][langIndex];

  // setting
  static String get dataBaseSector =>
      ["DataBase sector", "قطاع قاعدة البيانات"][langIndex];
  static String get importDatabase => [
        "Import database | Create Backup",
        "استيراد قاعدة البيانات | إنشاء نسخة احتياطية"
      ][langIndex];
  static String get exportDatabase => [
        "Export database | Get from Backup",
        "تصدير قاعدة البيانات | تحميل نسخة احتياطية"
      ][langIndex];
  static String get clearDatabase => [
        "Clear database     | Delete all data",
        "مسح قاعدة البيانات | حذف كل البيانات"
      ][langIndex];
  static String get informationSector =>
      ["Information sector", "قطاع المعلومات"][langIndex];
  static String get name => ["Name", "الاسم"][langIndex];
  static String get stockName => ["Stock name", "اسم المخزن"][langIndex];
  static String get wifiName => ["WiFi name", "اسم الشكبه"][langIndex];
  static String get wifiPass =>
      ["WiFi Password", "الرقم السري للشكبه"][langIndex];
  static String get phone => ["Phone", "الهاتف"][langIndex];
  static String get stockPhone =>
      ["Stock Place ", "هاتف مسئول المخزن"][langIndex];
  static String get address => ["Address", "العنوان"][langIndex];
  static String get stockAddress =>
      ["Stock Address", "عنوان المخزن"][langIndex];
  static String get styleSector => ["Style sector", "قطاع الأسلوب"][langIndex];
  static String get hardwareSection =>
      ["Hardware sector", "اعدادات الجهاز"][langIndex];
  static String get config =>
      ["Send WiFi configuration", "ارسال اعدادات الشبكه"][langIndex];
  static String get send => ["Send", "ارسال"][langIndex];
  static String get language => ["Language", "اللغة"][langIndex];
  static String get en => ["English", "الإنجليزية"][langIndex];
  static String get ar => ["Arabic", "العربية"][langIndex];
  static String get system => ["System", "النظام"][langIndex];
  static String get theme => ["Theme", "الأسلوب"][langIndex];
  static String get light => ["Light", "الفاتح"][langIndex];
  static String get dark => ["Dark", "الداكن"][langIndex];

  // records
  static String get view => ["View", "عرض"][langIndex];
  static String get delete => ["Delete", "حذف"][langIndex];
  static String get noRecords => ["No Records", "لا توجد سجلات"][langIndex];

  // materials
  static String get noMaterial => ["No Material", "لا توجد مواد"][langIndex];

  // home
  static String get item => ["Item", "عنصر"][langIndex];
  static String get itemsCount => ["Items Count", "عدد العناصر"][langIndex];
  static String get material => ["Material", "المادة"][langIndex];
  static String get materialName =>
      ["Material name or code", "اسم المادة أو الكود"][langIndex];
  static String get materialQuantity =>
      ["Material Quantity", "كميه المادة"][langIndex];

  static String get countDate =>
      ["Count Start Date", "تاريخ الخروج"][langIndex];
  static String get print => ["Print", "طباعة"][langIndex];
  static String get reset => ["Reset", "الاعاده"][langIndex];
  static String get start => ["Start", "البدأ"][langIndex];
  static String get edit => ["Edit", "تعديل"][langIndex];
  static String get save => ["Save", "حفظ"][langIndex];
  static String get date => ["Date", "التاريخ"][langIndex];
  static String get search => ["Search For", "بحث عن"][langIndex];

  // reports
  static String get graph1 =>
      ["Number Of Outs ber day", "عدد الخروج باليوم"][langIndex];
  static String get graph2 =>
      ["Amount of items ber day", "كميه العناصر باليوم"][langIndex];
  static String get printsSector =>
      ["Print Reports", "طباعة التقارير"][langIndex];
  static String get allRecords => ["ALL Records", "كل السجلات"][langIndex];
  static String get allMaterials => ["ALL Materials", "كل المواد"][langIndex];
  static String get filterRecords =>
      ["Filter Records", "تصفية السجلات"][langIndex];
  static String get filterMaterials =>
      ["Filter Materials", "تصفية المواد"][langIndex];
  static String get highRecords =>
      ["High Counts Records", "سجلات العناصر الكثيره"][langIndex];
  static String get lowRecords =>
      ["Low Counts Records", "سجلات العناصر المنخفض"][langIndex];
  static String get highMaterials =>
      ["Highest Material", "المادة الزائدة"][langIndex];
  static String get lowMaterial =>
      ["Lowest Material", "المادة المنخفضة"][langIndex];
}
