sap.ui.require(
  [
    "sap/fe/test/JourneyRunner",
    "zlab/zlabcars/test/integration/FirstJourney",
    "zlab/zlabcars/test/integration/pages/CarsList",
    "zlab/zlabcars/test/integration/pages/CarsObjectPage",
  ],
  function (JourneyRunner, opaJourney, CarsList, CarsObjectPage) {
    "use strict";
    var JourneyRunner = new JourneyRunner({
      // start index.html in web folder
      launchUrl: sap.ui.require.toUrl("zlab/zlabcars") + "/index.html",
    });

    JourneyRunner.run(
      {
        pages: {
          onTheCarsList: CarsList,
          onTheCarsObjectPage: CarsObjectPage,
        },
      },
      opaJourney.run
    );
  }
);
