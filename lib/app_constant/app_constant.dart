

class AppConstant {
  static final String boxName = "favorate_storage";
  static String getURL="https://en.wikiquote.org/w/api.php?action=query&list=random&rnnamespace=0&rnlimit=1000&format=json";
  static String getUrlInfromation(String title){
    return "https://en.wikiquote.org/w/api.php?action=parse&page=$title&format=json&prop=text&formatversion=2";
  }
    static final String appImagePath="asset/icon/ic_launcher.png";
  static final String developerName="Muhammad Shoiab";
  static final String developerContent="03238602527";
  static final String developerGmail="shoaibsn54321@gmail.com";
  static final String settingsDatabaseName = "appSettings";
}
