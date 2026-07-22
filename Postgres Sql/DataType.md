# PostgreSQL Data Types

## Numeric Types
- `smallint` – 2‑byte integer
- `integer` / `int` – 4‑byte integer
- `bigint` – 8‑byte integer
- `serial`, `bigserial` – auto‑incrementing integer types
- `numeric` / `decimal` – exact‑precision numbers
- `real` – single precision floating point
- `double precision` – double precision floating point

## Boolean Type
- `boolean` (`bool`) – true/false

## Character & Text Types
- `character(n)` / `char(n)` – fixed‑length string
- `character varying(n)` / `varchar(n)` – variable‑length string
- `text` – unlimited length string

## Binary Data
- `bytea` – binary data (“byte array”)

## Date/Time Types
- `date` – calendar date (year, month, day)
- `time [without time zone]` – time of day
- `time with time zone` – time of day with offset
- `timestamp [without time zone]` – date and time
- `timestamp with time zone` (`timestamptz`) – date and time with time‑zone
- `interval` – span of time

## UUID
- `uuid` – universally unique identifier

## JSON Types
- `json` – text representation of JSON
- `jsonb` – binary JSON, searchable and indexable

## Array Types
- `type[]` – arrays of any base type (e.g., `integer[]`, `text[]`)
## Monetary Type
 - money - A fixed-point type used for storing currency values.
## Enumerated Types
- `enum` – user‑defined set of values

## Range Types
- `int4range`, `int8range`, `numrange`, `tsrange`, `tstzrange`, `daterange` – represent a range of values

## Geometric Types
- `point`, `line`, `lseg`, `box`, `path`, `polygon`, `circle`

## Network Address Types
- `cidr` – IP network
- `inet` – IP address
- `macaddr` – MAC address

## XML Type
- `xml` – XML data

## Hstore Type
- `hstore` – key‑value pair store 