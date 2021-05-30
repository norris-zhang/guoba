# guoba

### Datamodel rules
1. If a column has a default value, it must be defined as NOT NULL.
2. Boolean columns are defined as CHAR(1). Y/N are the permitted values. This is for database query readibility.
3. Boolean columns must have a defined value, for example 'N'.
