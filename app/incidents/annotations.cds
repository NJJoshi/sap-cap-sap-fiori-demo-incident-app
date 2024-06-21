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
            Label : '{i18n>Identifier}',
        },
        {
            $Type : 'UI.DataField',
            Value : priority_code,
            Criticality : priority.criticality,
            CriticalityRepresentation : #WithoutIcon,
            Label : '{i18n>Priority}',
        },
        {
            $Type : 'UI.DataField',
            Value : incidentStatus_code,
            Label : '{i18n>IncidentStatus}',
        },
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : '{i18n>Title}',
        },
        {
            $Type : 'UI.DataField',
            Value : category_code,
            Label : '{i18n>Category}',
        },
    ]
);
annotate service.Incidents with @(
    UI.FieldGroup #IncidentDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : identifier,
                Label : '{i18n>Identifier}',
            },
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : '{i18n>Title}',
            },
            {
                $Type : 'UI.DataField',
                Value : description,
                Label : '{i18n>IncidentDescription}',
            },
        ],
    }
);
annotate service.Incidents with @(
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>IncidentOverview}',
            ID : 'IncidentOverviewFacet',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>IncidentDetails}',
                    ID : 'IncidentDetailsFacet',
                    Target : '@UI.FieldGroup#IncidentDetails',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>GeneralInformation}',
                    ID : 'GeneralInformation',
                    Target : '@UI.FieldGroup#GeneralInformation',
                },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>IncidentProcessFlow}',
            ID : 'ProcessFlowFacet',
            Target : 'incidentFlow/@UI.LineItem',
        },
    ],
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : priority_code,
                Label : '{i18n>Priority}',
            },{
                $Type : 'UI.DataField',
                Value : category_code,
                Label : '{i18n>Category}',
            },{
                $Type : 'UI.DataField',
                Value : incidentStatus_code,
                Label : '{i18n>IncidentStatus}',
            },],
    }
);
annotate service.IncidentFlow with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : stepStatus,
            Criticality : criticality,
            Label : '{i18n>ProcessStepStatus}',
        },
        {
            $Type : 'UI.DataField',
            Value : processStep,
            Label : '{i18n>ProcessStep}',
        },
        {
            $Type : 'UI.DataField',
            Value : stepStartDate,
            Label : '{i18n>StepStartDate}',
        },
        {
            $Type : 'UI.DataField',
            Value : stepEndDate,
            Label : '{i18n>StepEndDate}',
        },
        {
            $Type : 'UI.DataField',
            Value : incident.assignedIndividual.fullName,
            Label : '{i18n>CreatedBy}',
        },
    ]
);
annotate service.Incidents with {
    incidentStatus @Common.Label : '{i18n>IncidentStatus}'
};
annotate service.Incidents with {
    priority @Common.Label : '{i18n>Priority}'
};
annotate service.Incidents with {
    category @Common.Label : '{i18n>Category}'
};
annotate service.Incidents with @(
    UI.FieldGroup #HeaderGeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : priority_code,
                Label : '{i18n>Priority}',
            },
            {
                $Type : 'UI.DataField',
                Value : incidentStatus_code,
                Label : '{i18n>IncidentStatus}',
            },
            {
                $Type : 'UI.DataField',
                Value : category_code,
                Label : '{i18n>Category}',
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'assignedIndividual/@Communication.Contact',
                Label : '{i18n>AssignedContact}',
            },
        ],
    }
);
