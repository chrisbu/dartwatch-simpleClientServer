#import("dart:io");  // import the dart:io library
#import("dart:json"); // import the json library

main() {
  HttpServer server = new HttpServer(); // create the server
  server.addRequestHandler(matchMyApp, myAppHandler); //if any request begins with myApp, handle it
  //server.defaultRequestHandler = defaultHandler; //assign the handler function (defined below)
  server.listen("127.0.0.1", 8080); // and start listening
  print("listening on http://127.0.0.1:8080");
}

defaultHandler(HttpRequest req, HttpResponse res) {
  Map data = new Map(); // create a map for the response
  print("Request for ${req.path}");
  data["get"] = req.path; // add the path to the data
  String responseData = JSON.stringify(data); // convert the map to JSON
  res.outputStream.writeString(responseData); // send the data back to the client
  res.outputStream.close(); // close the response
}

bool matchMyApp(HttpRequest req) {
  bool result = req.path.startsWith("/MyApp"); //match any request which begins with MyApp
  print("Matched MyApp: $result");
  return result;
}

///open the file and send it to the client
void myAppHandler(HttpRequest req, HttpResponse res) {
  File file = new File(".${req.path}"); //open the file, eg: ./MyApp.html
  file.openInputStream().pipe(res.outputStream); //send the data from the file to the response
}