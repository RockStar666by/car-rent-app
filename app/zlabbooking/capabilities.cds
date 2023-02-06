using {RentService} from '../../srv/services';

annotate RentService.Booking with @odata.draft.enabled;

annotate RentService.Booking with
@(
    Capabilities                    : {
        Deletable  : true,
        Insertable : true
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [
        {
            Property           : 'beginDate',
            AllowedExpressions : 'SingleValue'
        },
        {
            Property           : 'endDate',
            AllowedExpressions : 'SingleValue'
        },
        {
            Property           : 'beginTime',
            AllowedExpressions : 'SingleValue'
        },
        {
            Property           : 'endTime',
            AllowedExpressions : 'SingleValue'
        }
    ]}
);
