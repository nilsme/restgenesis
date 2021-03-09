# README

Basic usage of the Destatis Genesis API.

> A (free) account is required to use the API.

## Python

```Python
from getpass import getpass
from genesis2pd import get_tablefile

username = 'username'
password = getpass()
name = '12411-0001'

df = get_tablefile(username=username, password=password, name=name)

df.head()
```

## R

```R
source('genesis2df.R')

username <- 'username'
password <- 'password'
name <- '12411-0001'

df <- get_tablefile(username, password, name)

head(df)
```
