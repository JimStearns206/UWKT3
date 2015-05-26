__author__ = 'jimstearns'
# Test (not unit-test) of UrlFileDownloaderWithLogin.
import requests
import UrlFileDownloaderWithLogin

# The direct link to the Kaggle data set
data_url_base = 'https://www.kaggle.com/c/predict-west-nile-virus/download/'
data_files = (
        'noaa_weather_qclcd_documentation.pdf',
        'weather.csv.zip',
        'spray.csv.zip',
        'train.csv.zip',
        'sampleSubmission.csv.zip',
        'test.csv.zip',
        'mapdata_copyright_openstreetmap_contributors.rds',
        'mapdata_copyright_openstreetmap_contributors.txt.zip',
        'west_nile.zip'
    )

# Kaggle Username and Password
username = "jms206"
password = "c&$CPcJaZD5%"

for data_file in data_files:
    url = data_url_base + data_file
    print("Datafile URL is: {0}".format(url))
    UrlFileDownloaderWithLogin.Download(url, username, password, data_file)