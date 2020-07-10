var webix = require('webix');
webix.ready(() => {
  webix.ui({
    view:'template',
    template: "Hello webix !"
  });

  var window = webix.ui({
    view:"window",
    id:"my_win",
    head:"My Window",
    width: 200,
    height: 200,
    move:true,
    close:true,
    body:{
      template:"Some text"
    }
  }).show();

});



