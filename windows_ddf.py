import io
import os
import requests
from bs4 import BeautifulSoup
from zipfile import ZipFile

root = 'windows-ddf'
keep = {'LICENSE', 'LICENSE-CODE', 'DDFv2.xsd', 'DDFv2Msft.xsd'}

page = requests.get('https://learn.microsoft.com/en-us/windows/client-management/mdm/configuration-service-provider-ddf')
page.raise_for_status()
url = next(a['href'] for a in BeautifulSoup(page.text, 'html.parser').find_all('a', href=True) if a['href'].endswith('.zip') and 'DDFv2' in a['href'])
print('Latest DDF:', url)

response = requests.get(url)
response.raise_for_status()

for name in os.listdir(root):
    if name not in keep:
        os.remove(os.path.join(root, name))

with ZipFile(io.BytesIO(response.content)) as z:
    for info in z.infolist():
        if not info.is_dir():
            with open(os.path.join(root, os.path.basename(info.filename)), 'wb') as f:
                f.write(z.read(info))
