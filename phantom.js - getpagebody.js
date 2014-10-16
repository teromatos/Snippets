//to run: phantomjs.exe getpagebody.js http://stackoverflow.com

var page = require('webpage').create(),
  system = require('system'),
  fs = require('fs'),
  t, address;

if (system.args.length === 1) {
  console.log('Usage: getpagebody.js <some URL>');
  phantom.exit();
}

t = Date.now();
address = system.args[1];
console.log('Loading: ' + address);    
page.open(address, function(status) {
  if (status !== 'success') {
    console.log('FAIL to load the address');
  } else {
    t = Date.now() - t;
    console.log('Loading time ' + t + ' msec');    
    var pageBody = page.evaluate(function() {
      return document.documentElement.innerHTML;
      return document.innerHTML;
      return document.body.innerHTML;      
      return document.title;
    });

    var path = 'pagetext.html';
    try {
      if (fs.exists(path))
        fs.remove(path);

      fs.write(path, pageBody, 'w')
      console.log('Output: ' + path);
    } catch(e) {
      console.log(e)
    }    
  }
  console.log('');
  phantom.exit();
});



// var page = require('webpage').create();
// page.open('http://www.sample.com', function() {
  // page.includeJs("http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js", function() {
    // page.evaluate(function() {
      // $("button").click();
    // });
    // phantom.exit()
  // });
// });


// var page = require('webpage').create();
// console.log('The default user agent is ' + page.settings.userAgent);
// page.settings.userAgent = 'SpecialAgent';
// page.open('http://www.httpuseragent.org', function(status) {
  // if (status !== 'success') {
    // console.log('Unable to access network');
  // } else {
    // var ua = page.evaluate(function() {
      // return document.getElementById('myagent').textContent;
    // });
    // console.log(ua);
  // }
  // phantom.exit();
// })