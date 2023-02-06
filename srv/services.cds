using epam.sap.dev.rent as rent from '../db/schema';
using masterdata as masterdata from '../db/master-data';
using sap.common as common from '@sap/cds/common';

service RentService {
    entity Booking      as projection on rent.Booking actions {
        @Core.OperationAvailable: in.returnTheCarEnabled
        action returnTheCar()
    };

    entity Cars        as projection on rent.Cars actions {
        action orderCar(Quantity: Integer @title : 'Order Quantity');
    };

    entity Clients     as projection on rent.Clients;

    entity Offices      as projection on rent.Offices;

    entity Statuses     as projection on masterdata.Statuses;

    entity CarStatuses as projection on masterdata.CarStatuses;

    entity Makes as projection on masterdata.Makes;

    entity Models as projection on masterdata.Models;

    entity Currencies   as projection on common.Currencies;
}
