using RentService as service from '../../srv/services';

annotate service.Cars with @(
    UI        : {
        SelectionFields     : [toOffice_officeUUID, status_ID],
        Identification      : [{Value : carUUID}, { $Type : 'UI.DataFieldForAction', Action : 'RentService.orderCar', Label : '{i18n>orderCar}'},],
        Chart #radialChart : {
            Title : '{i18n>radialChart}',
            Description : '{i18n>ThisIsAMicroChart}',
            ChartType : #Donut,
            Measures : [
                available,
            ],
            MeasureAttributes : [
                {
                    $Type : 'UI.ChartMeasureAttributeType',
                    Measure : available,
                    Role : #Axis1,
                    DataPoint : '@UI.DataPoint#radialChart',
                },
            ],
        },
        DataPoint #radialChart : { 
            Value : available,
            TargetValue : quantity,
            Criticality : status.criticality,
        },
        SelectionPresentationVariant#all : {
            Text: 'All',
            SelectionVariant: {
                SelectOptions:
                [
                    {
                        $Type : 'UI.SelectOptionType',
                        PropertyName : status_ID,
                        Ranges: [
                            {
                                $Type: 'UI.SelectionRangeType',
                                Option: #BT,
                                Low: '0',
                                High: '2',
                                Sign: #I,                              
                            },
                        ]
                    }
                ]
            },
            PresentationVariant: {
                MaxItems       : 1000,
                SortOrder      : [{Property : 'carID'}],
                TotalBy: [available],
                GroupBy: [status_ID],
                IncludeGrandTotal: true,
                Visualizations: ['@UI.LineItem']
            }
        },
        SelectionPresentationVariant#instock : {
            Text: 'In Stock',
            SelectionVariant: {
                SelectOptions:
                [
                    {
                        $Type : 'UI.SelectOptionType',
                        PropertyName : status_ID,
                        Ranges: [
                            {
                                $Type: 'UI.SelectionRangeType',
                                Option: #EQ,
                                Low: '0',
                                Sign: #I,                              
                            }
                        ]
                    }
                ]
            },
            PresentationVariant: {
                MaxItems       : 1000,
                SortOrder      : [{Property : 'carID'}],
                Total: [rent],
            }
        },
        SelectionPresentationVariant#runout  : {
            Text: 'Run Out',
            SelectionVariant: {
                SelectOptions : [
                    {
                        $Type : 'UI.SelectOptionType',
                        PropertyName : status_ID,
                        Ranges: [
                            {
                                $Type: 'UI.SelectionRangeType',
                                Option: #EQ,
                                Low: '1',
                                Sign: #I
                            }
                        ]
                    },
                ],       
            },
            PresentationVariant: {
                MaxItems       : 1000,
                SortOrder      : [{Property : 'carID'}],
                TotalBy: [available],
                GroupBy: [toOffice.street],
                IncludeGrandTotal: true,
                Visualizations: ['@UI.LineItem'], 
            }
            
        },
        SelectionPresentationVariant#outofstock  : {
            Text: 'Out of Stock',
            SelectionVariant: {
                SelectOptions : [
                    {
                        $Type : 'UI.SelectOptionType',
                        PropertyName : status_ID,
                        Ranges: [
                            {
                                $Type: 'UI.SelectionRangeType',
                                Option: #EQ,
                                Low: '2',
                                Sign: #I
                            }
                        ]
                    },
                ],       
            },
            PresentationVariant: {
                MaxItems       : 1000,
                SortOrder      : [{Property : 'carID'}],
                TotalBy: [available],
                GroupBy: [toOffice.street],
                IncludeGrandTotal: true,
                Visualizations: ['@UI.DataPoint#radialChart'], 
            }
            
        },
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : carID,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : status_ID,
                Criticality       : status.criticality,
                ![@UI.Importance] : #High,
                ![@HTML5.CssDefaults] : {width : '10rem'}
            },
            {
                $Type             : 'UI.DataField',
                Value             : make,
                ![@UI.Importance] : #High,
                ![@HTML5.CssDefaults] : {width : '100%'}
            },
            {
                $Type             : 'UI.DataField',
                Value             : model,
                ![@UI.Importance] : #High,
                ![@HTML5.CssDefaults] : {width : '100%'}
            },
            {
                $Type             : 'UI.DataField',
                Value             : quantity,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : available,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : '@UI.Chart#radialChart',
                Label   : '{i18n>radialChart}',
            },
            {
                $Type             : 'UI.DataField',
                Value             : rent,
                ![@UI.Importance] : #High
            }
        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : carID,
            Descending : false
        }]},
    },
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Car',
            TypeNamePlural : 'Cars',
            Title          : {Value : make},
            Description    : {Value : toOffice.street}
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
                Value : quantity
            },
            {
                $Type : 'UI.DataField',
                Value : available
            },
        ]},
        FieldGroup #Details            : {Data : [
            {
                $Type : 'UI.DataField',
                Value : carID
            },
            {
                $Type       : 'UI.DataField',
                Value       : status_ID,
                Criticality : status.criticality
            },
            {
                $Type : 'UI.DataField',
                Value : make
            },
                        {
                $Type : 'UI.DataField',
                Value : model
            },
            {
                $Type : 'UI.DataField',
                Value : toOffice_officeUUID
            },
            {
                $Type : 'UI.DataField',
                Value : quantity
            },
            {
                $Type : 'UI.DataField',
                Value : available
            },
            {
                $Type : 'UI.DataField',
                Value : rent
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
