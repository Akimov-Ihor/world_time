import 'package:http/http.dart' as https;
import 'package:intl/intl.dart';
import 'dart:convert';


class WorldTime {
   String location; // location name for the UI
   String time ; // the time in that location
   String flag ; // url to an asset flag icon
   String url ; // location url for api endpoint
   bool isDayTime ; // true or false if daytime or not

   WorldTime({this.location,this.time,this.flag,this.url});

   Future<void> getTime() async {
     try{
       dynamic urlForFetch = Uri.parse( "https://worldtimeapi.org/api/timezone/$url" );
       https.Response response = await https.get(urlForFetch);
       Map data = jsonDecode(response.body);

       String datetime = data['datetime'];
       String offset = data['utc_offset'].substring(1.3);
       print(datetime);
       print(offset);

       //create DateTime object
       DateTime now = DateTime.parse(datetime);
       now.add(Duration(hours: int.parse(offset)));
       print(now);

       //set to time property
       isDayTime =  (now == null ? false : now.hour > 6 && now.hour < 20) ;
       print(isDayTime);
       time = DateFormat.Hm().format(now) ;

     }catch(e){
        print('caught error: $e');
        time = 'could not get time data';
     }



   }

}


