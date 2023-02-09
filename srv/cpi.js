const cds = require("@sap/cds");
const constants = require("./constants");

module.exports = {
  orderCar: orderCar,
  sendCar: sendCar,
};

const { Cars, Offices } = cds.entities("epam.sap.dev.rent");

async function orderCar(req) {
  try {
    const { carUUID } = req.params[0];
    const quantity = req.data.Quantity;
    const orderInfo = await SELECT.from(Cars).where({ carUUID: carUUID });
    if (quantity > 0) {
      const officeInfo = await SELECT.from(Offices).where({
        officeUUID: orderInfo[0].toOffice_officeUUID,
      });
      const payload = {
        carUUID: orderInfo[0].carUUID,
        make: orderInfo[0].make,
        model: orderInfo[0].model,
        officeUUID: orderInfo[0].toOffice_officeUUID,
        officeCity: officeInfo[0].city,
        officeStreet: officeInfo[0].street,
        CurrencyCode_code: orderInfo[0].CurrencyCode_code,
        rent: orderInfo[0].rent,
        quantity: quantity,
        status_ID: "1",
      };
      const cpi = await cds.connect.to("CPIDestination");
      await cpi.tx(req).post("/http/rent-order", payload);
      await UPDATE(Cars, { carUUID: carUUID }).with({ status_ID: "1" });
    } else return req.error(400, constants.genericErrors.quantityNotApplicable);
  } catch (error) {
    console.log(
      "Dispatch to CPI was not successful. Rejected with error: ",
      error
    );
  }
}

async function sendCar(req) {}
