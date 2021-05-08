import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:weather/model/model.dart';
import 'package:weather/util/time_card_util.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

TextEditingController cityName = new TextEditingController();
WeatherResponse _response;

class _HomePageState extends State<HomePage> {
  TextEditingController locationController = new TextEditingController();
  final DataService dataServiceController = Get.put(DataService());
  final RoundedLoadingButtonController _btnLoginController =
      new RoundedLoadingButtonController();

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String cityName;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";

        cityName = place.locality;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    IconThemeData iconTheme = Theme.of(context).iconTheme;
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.5),
      appBar: CupertinoNavigationBar(
        middle: Text('S4S'),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text('Suraj Singh'),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      //color: Colors.blue,
                      borderRadius: BorderRadius.circular(32)),
                  width: size.width * .80,
                  height: 56,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: CupertinoTextField(
                      padding: EdgeInsets.only(left: 62),
                      controller: locationController,
                      decoration: BoxDecoration(
                          color: colorScheme.onPrimary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(30)),
                      textAlignVertical: TextAlignVertical.center,
                      clearButtonMode: OverlayVisibilityMode.editing,
                      prefixMode: OverlayVisibilityMode.editing,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: 20),
                      placeholder: "Enter Location",
                      maxLines: 1,
                      maxLength: 30,
                      keyboardType: TextInputType.streetAddress,
                    ),
                  ),
                ),
                FlatButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.amber,
                    onPressed: _search,
                    icon: Icon(Icons.gps_fixed),
                    label: Text('Enter City Name'))
              ],
            ),
            if (_response != null)
              Stack(
                children: [
                  new Image.network(
                    _response.iconUrl,
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height * .30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          ("${_response.cityName}"),
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w200),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          _response.weatherInfo.description,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${_response.tempInfo.temperature}°',
                          style: TextStyle(fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'H:${_response.tempInfo.temperatureMax}°',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'L:${_response.tempInfo.temperatureMin}°',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            _response != null
                ? Card(
                    child: Container(
                      width: size.width,
                      height: size.height,
                      color: Colors.grey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  height: size.height * .21,
                                  width: size.width * .28,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Text('Now'),
                                      Image.network(_response.iconUrl),
                                      Text(
                                        '${_response.tempInfo.temperature}°',
                                        style: TextStyle(fontSize: 16),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  height: size.height * .21,
                                  width: size.width * .28,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Text('Clouds'),
                                      Image.network(_response.iconUrl),
                                      Text(
                                        '${_response.weatherInfo.description}',
                                        style: TextStyle(fontSize: 16),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  height: size.height * .21,
                                  width: size.width * .28,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Text('Location'),
                                      Image.network(
                                        _response.iconUrl,
                                        width: 70,
                                      ),
                                      Text(
                                        "Lat: ${_response.longInfo.lat}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                      ),
                                      Text(
                                        "Long: ${_response.longInfo.long}",
                                        style: TextStyle(fontSize: 16),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              height: size.height * .19,
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Text('${_response.cityName}' +
                                      " " +
                                      "${_response.countryInfo.country}"),
                                  Image.network(
                                    _response.iconUrl,
                                    width: 70,
                                  ),
                                  Text(
                                    'MinTemp: ${_response.tempInfo.temperatureMin}°',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                  Text(
                                    'MinTemp: ${_response.tempInfo.temperatureMax}°',
                                    style: TextStyle(fontSize: 16),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              height: size.height * .19,
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            child: Image.network(
                                              "https://images.unsplash.com/photo-1603361938218-56a2c23ece99?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
                                              width: 130,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(60),
                                          ),
                                          Text(
                                              'Sun Rise ${_response.countryInfo.sunrise}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            child: Image.network(
                                              "https://images.unsplash.com/photo-1603361938218-56a2c23ece99?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
                                              width: 130,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(60),
                                          ),
                                          Text(
                                              'Sun Set ${_response.countryInfo.sunset}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              height: size.height * .19,
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      "Weather Description: ${_response.weatherInfo.description}"),
                                  Text("Visibility: ${_response.visibility}"),
                                  Text("Time Zone: ${_response.timezone}"),
                                  Text(
                                      "Humidity: ${_response.temperatureMinInfo.humidity}"),
                                  Text(
                                      "Temperature Feels: ${_response.temperatureMinInfo.temperatureFeels}"),
                                  Text(
                                      "Pressure: ${_response.temperatureMinInfo.pressure}"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    child: Text(
                      "We Have Two Options\n1 Enter the Location Name Get Weather Info \n2 Weather is show By Your current Location If field is empty ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    alignment: Alignment.center,
                  ),
          ],
        ),
      ),
    );
  }

  void _search() async {
    String location = locationController.value.text;

    if (location != "") {
      final response = await dataServiceController.getWeather(location);

      setState(() => _response = response);
    } else if (cityName != "") {

      final response = await dataServiceController.getWeather(cityName);

      setState(() => _response = response);
    }
  }
}
