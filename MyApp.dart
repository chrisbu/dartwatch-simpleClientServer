#import('dart:html');

class MyApp {

  MyApp() {
  }

  void run() {
    write("Hello World!");    
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new MyApp().run(); // create an instance of the class and call the run method
  
  addUiElements();
}

addUiElements() {
  var elements = new Element.html("""
<div id="example">
  Enter some text:<input id="myTextbox" value="helloWorld"></input>
  <button id="myButton">Send request to server</button></br/>
  <span id="requestSpan">Request=</span><br />
  <span id="responseSpan">Response=</span></br />
</div>
""");
  document.body.nodes.add(elements);
  
  // add an event handler to the button
  ButtonElement button = document.body.query("#myButton"); // get a handle on the button
  
  button.on.click.add(EventListener (data) {
    // perform an XHR request to the server
    // for the url entered into the textbox
    
    // build the url 
    InputElement textbox = document.body.query("#myTextbox"); // get a handle on the textbox
    String url = "http://127.0.0.1:8080/${textbox.value}"; // IMPORTANT: url must be the same as in the browser
                                                           // if you navigate to this page using http://localhost
                                                           // then this url also needs to use http://localhost
                                                           // otherwise you will get Access-Control-Origin errors
    
    // add the url to the UI
    SpanElement requestSpan = document.body.query("#requestSpan"); // get the request span
    requestSpan.innerHTML += "GET: $url <br />"; // add the request to the UI
     
    // add a callback which will be executed on the server
    XMLHttpRequest request = new XMLHttpRequest.get(url, (XMLHttpRequest request) {
      SpanElement responseSpan = document.body.query("#responseSpan"); // get the response span
      responseSpan.innerHTML += "${request.responseText} <br />"; // add the output to the UI 
    }); 
  });
  
  
}
