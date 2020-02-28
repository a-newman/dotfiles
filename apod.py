"""
Script to download a picture from APOD to my Pictures directory. 

If the current day's item is a picture, download that. 

Otherwise, take a random picture from the archives.

Can also get a random pic with the --random flag.

Get an API key and read the APOD API documentation here: 
https://api.nasa.gov/
"""

import requests
import os 
import datetime
import random
import shutil
import matplotlib.pyplot as plt
from PIL import Image
from io import BytesIO
import fire

MY_KEY = os.environ['APOD_API_KEY']
APOD_ENDPOINT = "https://api.nasa.gov/planetary/apod"
OLDEST_DATE = datetime.date(1995, 6, 16)
TODAY = datetime.date.today()
DL_LOCATION = "/home/anelise/Pictures/apod/apod.png"

def _get(url, params={}): 
    r = requests.get(url, params)
    if r.status_code != 200: 
        raise RuntimeError("Could not get url {}; received code {}".format(url, r.status_code))
    return r

def _get_apod_img_url(params={}): 
    params['api_key'] = MY_KEY
    r = _get(APOD_ENDPOINT, params)
    content = r.json()
    if content['media_type'] != "image": 
        raise RuntimeError("Non-image media type: {}".format(content['media_type']))
    return content

def _dl_image_PIL(url, dl_path): 
    r = _get(url)
    im = Image.open(BytesIO(r.content))
    return im

def get_todays_picture(): 
    return _get_apod_img_url() 


def get_random_picture(n_tries=5): 
    for _ in range(n_tries): 
        try:
            # get a random day between the oldest date available and today 
            date_to_get = datetime.date.fromordinal(random.randint(OLDEST_DATE.toordinal(), TODAY.toordinal())).isoformat()
            print("Trying date {}".format(date_to_get))
            return _get_apod_img_url({'date': date_to_get})
        except Exception as e: 
            print(e)

    raise RuntimeError("Unable to get a video resource after {} tries".format(n_tries))

def download_apod_picture(random): 
    if random: 
        data = get_random_picture()
    else: 
        try: 
            data = get_todays_picture()
        except: 
            print("Could not get today's picture, getting random pic")
            data = get_random_picture()

    im = _dl_image_PIL(data['hdurl'], "")

    return im, data


def make_pretty_display(im, data, savepath): 
    text_color="white"
    bg_color="black"
    title_size = 20
    text_size=12
    fontname = "serif"


    fig, ax = plt.subplots(facecolor=bg_color)
    fig.set_size_inches(w=16, h=9)
    ax.imshow(im)
    #plt.tight_layout()
    ax.axis('off')

    pretty_date = datetime.datetime.strptime(data['date'], "%Y-%m-%d").strftime("%B %d, %Y")
    ax.set_title("{} ({})".format(data['title'], pretty_date), 
        color=text_color,
        fontdict={'fontsize': title_size}, fontname=fontname)
    plt.figtext(.01, .01, data['explanation'], wrap=True, color=text_color, fontname=fontname, fontdict={'fontsize': text_size})

    plt.savefig(savepath, facecolor=bg_color, dpi=300)

def make_and_set_screensaver(random=False): 
    print('Setting APOD screensaver.')

    im, data = download_apod_picture(random=random)
    make_pretty_display(im, data, savepath=DL_LOCATION)

    # now set the screensaver 
    command = "gsettings set org.gnome.desktop.background picture-uri 'file://{}'".format(DL_LOCATION)
    os.system(command)

if __name__ == "__main__": 
    fire.Fire(make_and_set_screensaver)
