using {epam.sap.dev.rent as rent} from '../../db/schema';

annotate rent.Clients with @title : '{i18n>clientTitle}' {
    clientUUID    @UI.Hidden;
    clientID      @title             : '{i18n>clientID}';
    firstName     @title             : '{i18n>firstName}';
    lastName      @title             : '{i18n>lastName}';
    clientBirthday @title             : '{i18n>clientBirthday}';
    phoneNumber   @title             : '{i18n>phone}';
    email         @title             : '{i18n>email}'
}
