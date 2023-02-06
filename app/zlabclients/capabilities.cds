using {RentService} from '../../srv/services';

annotate RentService.Clients with @odata.draft.enabled;

annotate RentService.Clients with @(
    Capabilities                    : {
        Deletable  : true,
        Insertable : true
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [{
        Property           : 'clientBirthday',
        AllowedExpressions : 'SingleValue'
    }]}
);
