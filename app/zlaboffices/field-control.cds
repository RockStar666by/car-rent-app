using RentService from '../../srv/services';

annotate RentService.Offices with {
    officeID  @readonly;
    city @mandatory;
    street  @mandatory;
};
