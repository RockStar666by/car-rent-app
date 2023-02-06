using RentService from '../../srv/services';

annotate RentService.Clients with {
    clientID @readonly;
    firstName @mandatory;
    lastName @mandatory;
};
