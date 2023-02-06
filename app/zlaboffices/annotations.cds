using RentService as service from '../../srv/services';

annotate service.Offices with @(
    UI        : {
        SelectionFields     : [city],
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : officeID,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : city,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : street,
                ![@UI.Importance] : #High
            },
                        {
                $Type             : 'UI.DataField',
                Value             : phoneNumber,
                ![@UI.Importance] : #High
            },
        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : officeID,
            Descending : false
        }]},
    },
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Office',
            TypeNamePlural : 'Offices',
            Title          : {Value : city},
            Description    : {Value : street}
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
                Value : city
            },
            {
                $Type : 'UI.DataField',
                Value : street
            },
        ]},
        FieldGroup #Details            : {Data : [
            {
                $Type : 'UI.DataField',
                Value : officeID
            },
            {
                $Type : 'UI.DataField',
                Value : city
            },
            {
                $Type : 'UI.DataField',
                Value : street
            },
            {
                $Type : 'UI.DataField',
                Value : phoneNumber
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
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>carInfo}',
            Target : '@UI.LineItem'
        }
    ]
);
