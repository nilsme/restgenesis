import requests
from getpass import getpass
import pandas as pd


def test_conn():
    """
    Test connection to Genesis API

    :return: API response with user agent.
    """

    request = 'https://www-genesis.destatis.de/genesisWS/rest/2020/helloworld/whoami'

    try:
        response = requests.get(request)

    except:
        return print('Request returned an error.')

    return print(response.json())


def get_tablefile(username, password, name='12411-0001', out_format='ffcsv', area='all', lang='de'):
    """
    Get table from Genesis API and store response as data frame

    :param username: Genesis username
    :param password: Genesis password
    :param name: Number of the statistic
    :param out_format: Default to flat file csv for direct import in Pandas data frame
    :param area:
    :param lang: 'de' or 'en'
    :return: Pandas data frame
    """

    request = f'''https://www-genesis.destatis.de/genesisWS/rest/2020/data/tablefile?\
username={username}\
&password={password}\
&name={name}\
&area={area}\
&compress=false\
&transpose=false\
&startyear=\
&endyear=\
&timeslices=\
&regionalvariable=\
&regionalkey=\
&classifyingvariable1=\
&classifyingkey1=\
&classifyingvariable2=\
&classifyingkey2=\
&classifyingvariable3=\
&classifyingkey3=\
&format={out_format}\
&job=false\
&stand=01.01.1970\
&language={lang}'''

    try:
        df = pd.read_csv(request, sep=';')

    except:
        return print('Request returned an error.')

    return df


def main():
    test_conn()


if __name__ == "__main__":
    main()
