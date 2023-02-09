namespace epam.sap.dev.rent;

using { managed } from '@sap/cds/common';
using { masterdata } from './master-data';
using { sap.common.CodeList, Currency } from './common';

entity Booking: managed {
    key bookingUUID : UUID;
        bookingID   : Integer;
        carID       : Association to Cars;
        clientID    : Association to Clients;
        bookingStatus: Association to One masterdata.Statuses;
        beginDate   : Date;
        beginTime   : Time;
        endDate     : Date;
        endTime     : Time;
        image       : LargeBinary @Core.MediaType : 'image/png';
        virtual returnTheCarEnabled: Boolean;
}

entity Clients: managed {
    key clientUUID : UUID;
        clientID   : Integer;
        firstName  : String(15);
        lastName   : String(15);
        clientBirthday   : Date;
        phoneNumber    : String(30);
        licenseID: String(15);
        image      : LargeBinary @Core.MediaType : 'image/png';
};

entity Cars: managed {
    key carUUID      : UUID;
        carID        : Integer;
        toOffice     : Association to Offices;
        make         : String(40);
        model        : String(40);
        status       : Association to One masterdata.CarStatuses;
        quantity     : Integer;
        available    : Integer;
        rent         : Decimal(15, 2);
        CurrencyCode : Currency;
        image        : LargeBinary @Core.MediaType : 'image/png';
}

entity Offices: managed {
    key officeUUID    : UUID;
        officeID      : Integer;
        city     : String(40);
        street      : String(40);
        cars: Association to Many Cars on cars.toOffice = $self;
        phoneNumber   : String(15);
        image         : LargeBinary @Core.MediaType : 'image/png';
}
