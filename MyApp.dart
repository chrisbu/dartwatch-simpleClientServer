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
  <input id="textbox" />
  <button id="button" text="Request to server" /></br/>
  <span id="requestSpan">Request=</span><br />
  <span id="responseSpan">Response=</span></br />
</div>
""");
  document.window.nodes.add(elements);
  
}
