sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'zlab/zlabclients/test/integration/FirstJourney',
		'zlab/zlabclients/test/integration/pages/ClientsList',
		'zlab/zlabclients/test/integration/pages/ClientsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ClientsList, ClientsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('zlab/zlabclients') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheClientsList: ClientsList,
					onTheClientsObjectPage: ClientsObjectPage
                }
            },
            opaJourney.run
        );
    }
);