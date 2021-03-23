import 'package:http/http.dart' as https;
import 'package:intl/intl.dart';
import 'dart:convert';


class WorldTime {
   String location; // location name for the UI
   String time ; // the time in that location
   String flag ; // url to an asset flag icon
   String url ; // location url for api endpoint

   WorldTime({this.location,this.time,this.flag,this.url});

   Future<void> getTime() async {
     try{
       dynamic urlForFetch = Uri.parse( "https://worldtimeapi.org/api/timezone/$url" );
       https.Response response = await https.get(urlForFetch);
       Map data = jsonDecode(response.body);

       String datetime = data['datetime'];
       //String offset = data['utc_offset'];
       print(datetime);
       //print(offset);

       //create DateTime object
       DateTime now = DateTime.parse(datetime);
       // now.add(Duration(hours: '${offset'));
       print(now);

       //set to time property
       time = DateFormat.jm().format(now) ;
     }catch(e){
        print('caught error: $e');
        time = 'could not get time data';
     }



   }

}


