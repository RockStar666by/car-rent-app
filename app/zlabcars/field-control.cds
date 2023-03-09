using RentService from '../../srv/services';

annotate RentService.Cars with {
    carID       	@readonly;
    toOffice     	@mandatory;
    quantity      	@mandatory;
    rent        	@mandatory;
    CurrencyCode    @mandatory;
    status       	@mandatory;
};
