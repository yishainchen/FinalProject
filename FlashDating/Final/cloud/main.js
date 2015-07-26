
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");

Parse.Push.send({
  channels: [ "Giants", "Mets" ],
  data: {
    alert: "Please give me a msg!"
  }
}, {
  success: function() {
    // Push was successful
  },
  error: function(error) {
    // Handle error
  }
});

  
});
