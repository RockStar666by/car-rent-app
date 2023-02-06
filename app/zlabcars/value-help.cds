using {epam.sap.dev.rent as rent} from '../../db/schema';

annotate rent.Cars {
    toOffice     @Common.ValueList : {
        CollectionPath  : 'Office',
        Label           : '',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : toOffice_officeUUID,
                ValueListProperty : 'officeUUID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'officeID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'city'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'street'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phoneNumber'
            }
        ],
        SearchSupported : true
    };

    status       @Common.ValueList : {
        CollectionPath  : 'CarStatuses',
        Label           : '',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : status_ID,
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
        ],
        SearchSupported : true
    };

    CurrencyCode @Common.ValueList : {
        CollectionPath  : 'Currencies',
        Label           : '',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : CurrencyCode_code,
                ValueListProperty : 'code'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'symbol'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'minor'
            }
        ],
        SearchSupported : true
    };
}
