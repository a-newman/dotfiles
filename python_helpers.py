import json 
from IPython.display import HTML

MEMENTO_BASE_URI = "https://data.csail.mit.edu/soundnet/actions3/"

def jsonload(fpath): 
    with open(fpath) as infile: 
        data = json.load(infile)
    return data

def jsondump(fpath, data): 
    with open(fpath, 'w') as outfile: 
        json.dump(data, outfile)

def show_video(path): 
    print("path", path)
    return HTML("""
        <video width="480" height="360" controls>
            <source src="{0}">
        </video>
    """.format(path))
