using {epam.sap.dev.rent as rent} from '../../db/schema';

annotate rent.Offices with @title : '{i18n>officeTitle}' {
    officeUUID @UI.Hidden;
    officeID   @title                : '{i18n>officeID}';
    city  @title                     : '{i18n>officeCity}';
    street   @title                  : '{i18n>officeStreet}';
    phoneNumber  @title              : '{i18n>phoneNumber}';
}
