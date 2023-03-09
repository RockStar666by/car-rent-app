using {epam.sap.dev.rent as rent} from '../../db/schema';

annotate rent.Booking with @title         : '{i18n>bookingTitle}' {
    bookingUUID   @UI.Hidden;
    bookingID     @title                  : '{i18n>bookingID}';
    bookingStatus @title                  : '{i18n>status}'
                  @Common.Text            : bookingStatus.name
                  @Common.TextArrangement : #TextFirst;
    beginDate     @title                  : '{i18n>beginDate}';
    endDate       @title                  : '{i18n>endDate}';
    beginTime     @title                  : '{i18n>beginTime}';
    endTime       @title                  : '{i18n>endTime}';
    clientID      @title                  : '{i18n>client}'
                  @Common.Text            : clientID.lastName
                  @Common.TextArrangement : #TextOnly;
    carID         @title                  : '{i18n>car}'
                  @Common.Text            : carID.make
                  @Common.TextArrangement : #TextOnly;
}
