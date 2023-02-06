namespace masterdata;

entity Statuses {
    key ID          : String;
        name        : String(20);
        criticality : Integer;
}

entity CarStatuses {
    key ID          : String;
        name        : String(20);
        criticality : Integer;
}

entity Makes {
    key ID          : String;
        name        : String(20);
}

entity Models {
    key ID          : String;
        name        : String(20);
}