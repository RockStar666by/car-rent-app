using RentService as service from '../../srv/services';

annotate RentService.Booking with @(
    UI        : {
        Identification      : [{Value : bookingStatus_ID},
        { $Type: 'UI.DataFieldForAction', Action: 'RentService.returnTheCar', Label: '{i18n>returnTheCar}'},
        ],
        SelectionFields     : [
            bookingStatus_ID,
            carID_carUUID,
            clientID_clientUUID,
            beginDate,
            beginTime,
            endDate,
            endTime
        ],
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : bookingID,
                ![@UI.Importance] : #High,
            },
            {
                $Type             : 'UI.DataField',
                Value             : bookingStatus_ID,
                Criticality       : bookingStatus.criticality,
                ![@UI.Importance] : #High,
                ![@HTML5.CssDefaults] : {width : '10rem'}
            },
            {
                $Type             : 'UI.DataField',
                Value             : carID.make,
                ![@UI.Importance] : #High,
                ![@HTML5.CssDefaults] : {width : '100%'}
            },
            {
                $Type             : 'UI.DataField',
                Value             : carID.model,
                ![@UI.Importance] : #High,
                ![@HTML5.CssDefaults] : {width : '100%'}
            },
            {
                $Type             : 'UI.DataField',
                Value             : clientID.firstName,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : clientID.lastName,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : beginDate,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : beginTime,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : endDate,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : endTime,
                ![@UI.Importance] : #High
            }
        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : bookingID,
            Descending : false
        }]},
    },
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Booking',
            TypeNamePlural : 'Bookings',
            Title          : {Value : bookingStatus.ID},
            Description    : {Value : bookingStatus.name}
        },
        HeaderFacets                   : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        }],
        FieldGroup #Description        : {Data : [
            {
                $Type : 'UI.DataField',
                Value : image
            },
            {
                $Type : 'UI.DataField',
                Value : beginDate,
                Label : 'StartDate'
            },
            {
                $Type : 'UI.DataField',
                Value : endDate,
                Label : 'End Date'
            },
        ]},
        FieldGroup #Details2           : {Data : [{
            $Type : 'UI.DataField',
            Value : clientID_clientUUID
        }]},
        FieldGroup #Details3           : {Data : [{
            $Type : 'UI.DataField',
            Value : carID_carUUID
        }]},
        FieldGroup #Details1           : {Data : [
            {
                $Type : 'UI.DataField',
                Value : bookingID
            },
            {
                $Type       : 'UI.DataField',
                Value       : bookingStatus_ID,
                Criticality : bookingStatus.criticality
            },
        ]},
        FieldGroup #Details4           : {Data : [
            {
                $Type : 'UI.DataField',
                Value : beginDate
            },
            {
                $Type : 'UI.DataField',
                Value : beginTime
            },
            {
                $Type : 'UI.DataField',
                Value : endDate
            },
            {
                $Type : 'UI.DataField',
                Value : endTime
            },
        ]},
        FieldGroup #AdministrativeData : {Data : [
            {
                $Type : 'UI.DataField',
                Value : createdBy
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt
            }
        ]}
    },
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'PODetails',
            Label  : '{i18n>bookingInfo}',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : '{i18n>bookingInfo}',
                    Target : '@UI.FieldGroup#Details1'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : '{i18n>client}',
                    Target : '@UI.FieldGroup#Details2'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : '{i18n>car}',
                    Target : '@UI.FieldGroup#Details3'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : '{i18n>shedule}',
                    Target : '@UI.FieldGroup#Details4'
                }
            ]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'POAdmininfo',
            Label  : '{i18n>adminInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>adminInfo}',
                Target : '@UI.FieldGroup#AdministrativeData'
            }]
        }
    ]
);

