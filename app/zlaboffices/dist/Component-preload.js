//@ui5-bundle zlab/zlaboffices/Component-preload.js
jQuery.sap.registerPreloadedModules({
"version":"2.0",
"modules":{
	"zlab/zlaboffices/Component.js":function(){sap.ui.define(["sap/fe/core/AppComponent"],function(e){"use strict";return e.extend("zlab.zlaboffices.Component",{metadata:{manifest:"json"}})});
},
	"zlab/zlaboffices/i18n/i18n.properties":'# This is the resource bundle for zlab.zlaboffices\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Offices\n\n#YDES: Application description\nappDescription=A Fiori application.',
	"zlab/zlaboffices/manifest.json":'{"_version":"1.49.0","sap.app":{"id":"zlab.zlaboffices","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:lrop","version":"1.8.5","toolsId":"950d847e-c9fa-46b1-9e4b-9e93550ccc42"},"dataSources":{"mainService":{"uri":"rent/","type":"OData","settings":{"annotations":["annotation"],"localUri":"localService/metadata.xml","odataVersion":"4.0"}},"annotation":{"type":"ODataAnnotation","uri":"annotations/annotation.xml","settings":{"localUri":"annotations/annotation.xml"}}},"crossNavigation":{"inbounds":{"zlab-zlaboffices-inbound":{"signature":{"parameters":{},"additionalParameters":"allowed"},"semanticObject":"Offices","action":"manage","title":"{{appTitle}}","subTitle":"{{appSubTitle}}","icon":"sap-icon://home","indicatorDataSource":{"dataSource":"mainService","path":"/dynamic_dest/car-rent-app-srv-api/rent/Offices/$count","refresh":10}}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.109.3","libs":{"sap.m":{},"sap.ui.core":{},"sap.ushell":{},"sap.fe.templates":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"zlab.zlaboffices.i18n.i18n"}},"":{"dataSource":"mainService","preload":true,"settings":{"synchronizationMode":"None","operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}},"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"}},"resources":{"css":[]},"routing":{"config":{},"routes":[{"pattern":":?query:","name":"OfficesList","target":"OfficesList"},{"pattern":"Offices({key}):?query:","name":"OfficesObjectPage","target":"OfficesObjectPage"}],"targets":{"OfficesList":{"type":"Component","id":"OfficesList","name":"sap.fe.templates.ListReport","options":{"settings":{"entitySet":"Offices","initialLoad":"Enabled","variantManagement":"Page","navigation":{"Offices":{"detail":{"route":"OfficesObjectPage"}}}}}},"OfficesObjectPage":{"type":"Component","id":"OfficesObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"entitySet":"Offices"}}}}}},"sap.fiori":{"registrationIds":[],"archeType":"transactional"},"sap.cloud":{"public":true,"service":"carrentservice"}}'
}});
