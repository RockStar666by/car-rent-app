using {RentService} from '../../srv/services';

annotate RentService.Offices with @odata.draft.enabled;

annotate RentService.Offices with @(
    Capabilities                    : {
        Deletable  : true,
        Insertable : true
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [{
        Property           : 'city',
        AllowedExpressions : 'SingleValue'
    }]}
);
