using IncidentService as service from '../../srv/incidentservice';
using from '../annotations';
annotate service.Incidents with {
    assignedIndividual @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Individual',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : assignedIndividual_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'fullName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'emailAddress',
            },
        ],
    }
};

annotate service.Incidents with @(
    UI.SelectionFields : [
        incidentStatus_code,
        priority_code,
        category_code,
    ]
);
annotate service.Incidents with {
    category @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Category',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : category_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Incidents with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : identifier,
        },
        {
            $Type : 'UI.DataField',
            Value : priority_code,
            Criticality : priority.criticality,
            CriticalityRepresentation : #WithoutIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : incidentStatus_code,
        },
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : category_code,
        },
    ]
);
