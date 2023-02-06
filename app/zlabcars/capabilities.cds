using {RentService} from '../../srv/services';

annotate RentService.Cars with @odata.draft.enabled;

annotate RentService.Cars with @Capabilities : {
    Deletable  : true,
    Insertable : true
};
