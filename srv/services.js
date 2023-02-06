const cds = require("@sap/cds");
const cpi = require('./cpi');
const constants = require("./constants");

module.exports = cds.service.impl(async function () {
  let { Cars, Clients, Offices, Booking } = this.entities;

  this.before("NEW", "Cars", async (req) => {
    const { maxID } = await SELECT.one`max(carID) as maxID`.from(Cars);
    req.data.carID = maxID + 1;
    req.data.status_ID = "0";
  });

  this.before("NEW", "Clients", async (req) => {
    const { maxID } = await SELECT.one`max(clientID) as maxID`.from(Clients);
    req.data.clientID = maxID + 1;
  });

  this.before("NEW", "Offices", async (req) => {
    const { maxID } = await SELECT.one`max(officeID) as maxID`.from(Offices);
    req.data.officeID = maxID + 1;
  });

  this.before("NEW", "Booking", async (req) => {
    const { maxID } = await SELECT.one`max(bookingID) as maxID`.from(Booking);
    req.data.bookingID = maxID + 1;
    req.data.bookingStatus_ID = "2";
  });

  this.on("returnTheCar", "Booking", async (req) => {
    const { bookingUUID } = req.params[0];
    return UPDATE(Booking, bookingUUID).with({
      bookingStatus_ID: "1",
      endDate: new Date().toISOString().slice(0, 10),
      endTime: new Date().toISOString().slice(11, 19),
    });
  });

  this.before("CREATE", "Booking", async (req) => {
    const today = new Date().toISOString().slice(0, 10);
    req.data.beginDate = today;
    req.data.beginTime = new Date().toISOString().slice(11, 19);
  });

  this.before("SAVE", "Booking", async (req) => {
    const { carID_carUUID } = req.data;
    let { quantityCar } = await SELECT.one`quantity as quantityCar`
      .from(Cars)
      .where({ carUUID: carID_carUUID });
    let { availableCars } =
      await SELECT.one`count(bookingStatus_ID) as availableCars`
        .from(Booking)
        .where({ carId_carUUID: carID_carUUID, bookingStatus_ID: "2" });
    if (quantityCar <= availableCars) {
      return req.error(400, constants.genericErrors.carNotAvailable);
    }
  });

  this.before("CREATE", "Cars", async (req) => {
    const car = req.data;
    if (car.quantity < 0)
      return req.error(400, constants.genericErrors.wrongQuantityInput);
  });

  this.after("READ", "Booking", (each) => {
    if (each.bookingStatus_ID == "2") {
      each.returnTheBookEnabled = true;
    }
  });

  this.on("orderCar", "Cars", cpi.orderCar);
});
