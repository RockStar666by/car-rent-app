using RentService from '../../srv/services';

annotate RentService.Booking with {
    bookingID     @readonly;
    carID         @mandatory;
    clientID      @mandatory;
    bookingStatus @readonly;
    beginDate     @readonly;
    beginTime     @readonly;
    endDate       @readonly;
    endTime       @readonly;
};
