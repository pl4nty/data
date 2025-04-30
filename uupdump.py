import os
import shutil
import requests

root = 'uupdump'
update_id_file = os.path.join(root, 'updateId.txt')
if os.path.exists(update_id_file):
    with open(update_id_file, 'r') as f:
        existing_update_id = f.read().strip()

shutil.rmtree(root, ignore_errors=True)
os.makedirs(root)

updates = requests.get('https://api.uupdump.net/fetchupd.php?arch=amd64&ring=canary').json()
update = update['response']['updateArray'][0]
updateId = update['updateId']
if updateId == existing_update_id:
    raise SystemExit
print('Found new update:', update['updateTitle'])

files = requests.get(f'https://api.uupdump.net/get.php?id={updateId}&lang=en-us&edition=professional').json()
metadata_url = files['response']['files']['MetadataESD_professional_en-us.esd']['url']
with tempfile.NamedTemporaryFile(suffix='.esd') as metadata_file:
    response = requests.get(metadata_url, stream=True)
    with open(metadata_file, 'wb') as f:
        for chunk in response.iter_content(chunk_size=8192):
            f.write(chunk)

    try:
        subprocess.run(['apt-get', 'update'], check=True)
        subprocess.run(['apt-get', 'install', '-y', 'wimlib-tools'], check=True)
        subprocess.run(['wiminfo', metadata_file], check=True)
        subprocess.run([
            'wimextract', metadata_file, '3',
            '/Windows/SystemApps/Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy',
            '--dest-dir=' + os.path.join(root, 'MetadataESD', 'Client'),
            '--no-acls', '--preserve-dir-structure'
        ], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Output: {e.output}")
        print(f"Stderr: {e.stderr}")
        raise e

with open(update_id_file, 'w') as f:
    f.write(updateId)
