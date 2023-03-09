namespace masterdata;

entity Statuses {
    key ID          : String;
        name        : String(15);
        criticality : Integer;
}

entity CarStatuses {
    key ID          : String;
        name        : String(15);
        criticality : Integer;
}