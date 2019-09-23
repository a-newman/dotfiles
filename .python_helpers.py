import json 

def jsonload(fpath): 
    with open(fpath) as infile: 
        data = json.load(infile)
    return infile


def jsondump(fpath, data): 
    with open(fpath, 'w') as outfile: 
        json.dump(outfile, data)
