import os
import shutil
import requests
import subprocess
import tempfile
import time

def request(url, max_retries=6, retry_delay=10):
    response = requests.get(url)
    if response.status_code in (429, 500):
        if max_retries > 0:
            time.sleep(retry_delay)
            return request(url, max_retries-1, retry_delay)
        else:
            raise SystemExit
    return response

root = 'uupdump'
update_id_file = os.path.join(root, 'updateId')
existing_update_id = ''
if os.path.exists(update_id_file):
    with open(update_id_file, 'r') as f:
        existing_update_id = f.read().strip()

updates = request('https://api.uupdump.net/fetchupd.php?arch=amd64&ring=canary').json()
update = updates['response']['updateArray'][0]
updateId = update['updateId']
if updateId == existing_update_id:
    raise SystemExit

shutil.rmtree(root, ignore_errors=True)
os.makedirs(os.path.join(root, 'Client'))
print('Found new update:', update['updateTitle'])

files = request(f'https://api.uupdump.net/get.php?id={updateId}&lang=en-us&edition=professional').json()['response']['files']
# esd_files = [
#     'MetadataESD_professional_en-us.esd',
#     'Microsoft-Windows-Client-Desktop-Required-Package.ESD'
# ]
esd_files = [filename for filename in files if filename.lower().endswith('.esd')]
temp_dir = tempfile.mkdtemp()
downloaded_files = {}
for filename in esd_files:
    if filename in files:
        file_url = files[filename]['url']
        file_path = os.path.join(temp_dir, filename)
        downloaded_files[filename] = file_path
        
        print(f"Downloading {filename}...")
        response = requests.get(file_url, stream=True)
        with open(file_path, 'wb') as f:
            for chunk in response.iter_content(chunk_size=8192):
                f.write(chunk)
    else:
        print(f"Warning: File {filename} not available in the update")

try:
    subprocess.run(['sudo', 'apt-get', 'update'], check=True)
    subprocess.run(['sudo', 'apt-get', 'install', '-y', 'wimtools'], check=True)
    
    metadata_file = downloaded_files.get('MetadataESD_professional_en-us.esd')
    if metadata_file:
        subprocess.run(['wiminfo', metadata_file], check=True)
        for target in [
            '/Windows/SystemApps/Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy',
            '/Windows/SystemApps/Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe',
            '/Windows/SystemApps/MicrosoftWindows.Client.OOBE_cw5n1h2txyewy',
            '/Windows/System32/CodeIntegrity/driversipolicy.p7b',
            '/Windows/schemas'
            # requires delta WIMs
            # '/Windows/PolicyDefinitions'
        ]:
            subprocess.run([
                'wimextract', metadata_file, '3', target,
                '--dest-dir=' + os.path.join(root, 'Client'),
                '--no-acls', '--preserve-dir-structure', '--ref=' + os.path.join(temp_dir, '*.esd')
            ], check=True)
except subprocess.CalledProcessError as e:
    print(f"Output: {e.output}")
    print(f"Stderr: {e.stderr}")
    raise e
    
with open(update_id_file, 'w') as f:
    f.write(updateId)
