import json, sys

file_name = sys.argv[1]
raw_contents = open(file_name, 'r').read()
json_extract = json.loads(raw_contents)
print(json_extract['ip_address']['value'])
