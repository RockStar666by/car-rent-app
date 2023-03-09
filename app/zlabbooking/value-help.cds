using {epam.sap.dev.rent as rent} from '../../db/schema';

annotate rent.Booking {
    clientID      @Common.ValueList : {
        CollectionPath  : 'Clients',
        Label           : 'i18n>client',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : clientID_clientUUID,
                ValueListProperty : 'clientUUID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'clientID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'firstName'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'lastName'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'clientBirthday'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phoneNumber'
            }
        ],
        SearchSupported : true
    };
    carID        @Common.ValueList : {
        CollectionPath  : 'Cars',
        Label           : 'i18n>car',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : carID_carUUID,
                ValueListProperty : 'carUUID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'carID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'make',
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'model'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'quantity'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'available'
            }
        ],
        SearchSupported : true
    };
    bookingStatus @Common.ValueList : {
        CollectionPath  : 'Statuses',
        Label           : 'i18n>status',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : bookingStatus_ID,
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
        ],
        SearchSupported : true
    };
}
