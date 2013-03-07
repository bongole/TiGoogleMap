Titanium.UI.setBackgroundColor('#FFF');
var win = Ti.UI.createWindow();

var GM = require('com.bongole.ti.googlemap');

GM.APIKey = 'DUMMY API KEY'
var a = GM.createAnnotation(
    {latitude:33.74511, longitude:-84.38993, title: 'test', image:Ti.Filesystem.getFile(Ti.Filesystem.resourcesDirectory, "KS_nav_ui.png") }
);

var map = GM.createView({
    mapType: GM.SATELLITE_TYPE,
    region: {latitude:33.74511, longitude:-84.38993,
            latitudeDelta:0.01, longitudeDelta:0.01},
    userLocation:true,
});

map.addAnnotation(a);

win.add(map);

