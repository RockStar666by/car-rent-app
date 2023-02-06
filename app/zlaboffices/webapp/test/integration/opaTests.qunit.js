sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'zlab/zlaboffices/test/integration/FirstJourney',
		'zlab/zlaboffices/test/integration/pages/OfficesList',
		'zlab/zlaboffices/test/integration/pages/OfficesObjectPage'
    ],
    function(JourneyRunner, opaJourney, OfficesList, OfficesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('zlab/zlaboffices') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOfficesList: OfficesList,
					onTheOfficesObjectPage: OfficesObjectPage
                }
            },
            opaJourney.run
        );
    }
);