using {epam.sap.dev.rent as rent} from '../../db/schema';

annotate rent.Cars with @title       : '{i18n>modelID}' {
    carUUID     	@UI.Hidden;
    carID       	@title                  : '{i18n>carID}';
    toOffice    	@title                  : '{i18n>officeAddress}'
                 	@Common.Text            : toOffice.street
                 	@Common.TextArrangement : #TextOnly;
    quantity        @title                  : '{i18n>quantity}';
    available     	@title                  : '{i18n>available}';
    rent        	@title                  : '{i18n>rent}'
                 	@Measures.ISOCurrency   : CurrencyCode_code;
    status       	@title                  : '{i18n>carstatus}'
                 	@Common.Text            : status.name
                 	@Common.TextArrangement : #TextFirst;
    CurrencyCode @title                  : '{i18n>currency}'
                 	@Common.Text            : CurrencyCode.symbol
                 	@Common.TextArrangement : #TextLast;
}
