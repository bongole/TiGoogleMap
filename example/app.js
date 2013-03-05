// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window

Titanium.UI.setBackgroundColor('#FFF');
var win = Ti.UI.createWindow();

var GM = require('com.bongole.ti.googlemap');
GM.APIKey = 'YOUR API KEY'
var map = GM.createView({
    region: {latitude:33.74511, longitude:-84.38993,
        latitudeDelta:0.01, longitudeDelta:0.01},
        userLocation:true,
        width: '100dp',
        height: '100dp'
});

win.add(map);
