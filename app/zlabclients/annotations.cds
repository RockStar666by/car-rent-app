using RentService as service from '../../srv/services';

annotate service.Clients with @(
    UI        : {
        SelectionFields     : [clientBirthday],
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : clientID,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : firstName,
                ![@UI.Importance] : #High,
                ![@HTML5.CssDefaults] : {width : '100%'}
            },
            {
                $Type             : 'UI.DataField',
                Value             : lastName,
                ![@UI.Importance] : #High,
                ![@HTML5.CssDefaults] : {width : '100%'}
            },
            {
                $Type             : 'UI.DataField',
                Value             : clientBirthday,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : phoneNumber,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : email,
                ![@UI.Importance] : #High
            }
        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : clientID,
            Descending : false
        }]},
    },
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Client',
            TypeNamePlural : 'Clients',
            Title          : {Value : firstName},
            Description    : {Value : lastName}
        },
        HeaderFacets                   : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [
            {
                $Type : 'UI.DataField',
                Value : image
            },
            {
                $Type : 'UI.DataField',
                Value : clientBirthday
            },
            {
                $Type : 'UI.DataField',
                Value : phoneNumber
            },
        ]},
        FieldGroup #Details            : {Data : [
            {
                $Type : 'UI.DataField',
                Value : clientID
            },
            {
                $Type : 'UI.DataField',
                Value : firstName
            },
            {
                $Type : 'UI.DataField',
                Value : lastName
            },
            {
                $Type : 'UI.DataField',
                Value : clientBirthday
            },
            {
                $Type : 'UI.DataField',
                Value : phoneNumber
            },
                        {
                $Type : 'UI.DataField',
                Value : email
            }
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
            Label  : '{i18n>clientInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>clientinfo}',
                Target : '@UI.FieldGroup#Details'
            }]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'POAdmininfo',
            Label  : '{i18n>adminInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>admininfo}',
                Target : '@UI.FieldGroup#AdministrativeData'
            }]
        }
    ]
);
