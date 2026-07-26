 # schema.prisma
generator client {
}

datasource db {
}

model User {
}


# Filteringx
equals
not
in
contains
startsWith
endsWith
gt
gte
lt
lte

# Sorting

orderBy:[
    {
        name:"asc"
    },
    {
        age:"desc"
    }
]

- Relation and schema designing 