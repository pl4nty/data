import json
import os
import shutil
import requests
import subprocess
import tempfile
import time
from pathlib import Path
from asn1crypto import algos, cms, core, parser, x509

WDACKING_COMMIT = 'e19beb9ecb0e6dd538e7a236a9705d27cdcee97b'

def request(url, max_retries=6, retry_delay=10):
    response = requests.get(url)
    if response.status_code in (429, 500):
        if max_retries > 0:
            time.sleep(retry_delay)
            return request(url, max_retries-1, retry_delay)
        else:
            raise RuntimeError(f"{url} failed after retries: {response.status_code} {response.text[:200]}")
    response.raise_for_status()
    return response

root = 'uupdump'
update_id_file = os.path.join(root, 'updateId')
existing_update_id = ''
if os.path.exists(update_id_file):
    with open(update_id_file, 'r') as f:
        existing_update_id = f.read().strip()

updates = request('https://api.uupdump.net/fetchupd.php?arch=amd64&ring=dev').json()
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
esd_files = [
    filename for filename in files
    if filename.lower().endswith('.esd')
    # or filename == "cabs_Microsoft-Windows-MediaPlayer-Package-amd64.cab"
]
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
    
    metadata_file = downloaded_files.get('MetadataESD_professional_en-us.esd') or downloaded_files.get('professional_en-us.esd')
    if metadata_file:
        subprocess.run(['wiminfo', metadata_file], check=True)
        # print('WinRE files:')
        # subprocess.run(['wimdir', metadata_file, '1'], check=True)
        # print('Windows Setup files:')
        # subprocess.run(['wimdir', metadata_file, '2'], check=True)
        # print('Windows client files:')
        # subprocess.run(['wimdir', metadata_file, '3', '--path=/Windows'], check=True)

        for target in [
            '/Windows/SystemApps/Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy',
            '/Windows/SystemApps/Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe',
            '/Windows/SystemApps/MicrosoftWindows.Client.OOBE_cw5n1h2txyewy',
            '/Windows/System32/CodeIntegrity',
            '/Windows/schemas',
            '/Windows/L2Schemas',
            '/Windows/security/ApplicationId',
            # requires delta WIMs, non-trivial to generate from .cabs
            # '/Windows/PolicyDefinitions',
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

# decompile CI policies (.cip/.p7b) to SiPolicy XML
wdacking = os.path.join(temp_dir, 'wdacking')
subprocess.run(['git', 'init', '-q', wdacking], check=True)
subprocess.run(['git', '-C', wdacking, 'fetch', '-q', '--depth=1', 'https://github.com/antyg/wdacking', WDACKING_COMMIT], check=True)
subprocess.run(['git', '-C', wdacking, 'checkout', '-q', 'FETCH_HEAD'], check=True)
policies = [str(p.resolve()) for p in Path(root).rglob('*') if p.suffix.lower() in ('.cip', '.p7b')]
subprocess.run([
    'pwsh', '-NoProfile', '-Command',
    f'Import-Module "{wdacking}/src/antyg-wdacking.psd1"; $input | % {{ (ConvertFrom-WDACBinary -Path $_).Save("$_.xml") }}',
], input='\n'.join(policies), text=True, check=True)

# decompile certificate trust lists (.stl) to JSON; Microsoft extension values are undocumented, so kept as hex
class CTLExtension(core.Sequence):
    _fields = [('extn_id', core.ObjectIdentifier), ('critical', core.Boolean, {'default': False}), ('extn_value', core.OctetString)]
class CTLExtensions(core.SequenceOf):
    _child_spec = CTLExtension
class TrustedSubject(core.Sequence):
    _fields = [('subject_identifier', core.OctetString), ('subject_attributes', cms.CMSAttributes, {'optional': True})]
class TrustedSubjects(core.SequenceOf):
    _child_spec = TrustedSubject
class CertificateTrustList(core.Sequence):
    _fields = [
        ('version', core.Integer, {'default': 0}),
        ('subject_usage', core.SequenceOf, {'spec': core.ObjectIdentifier}),
        ('list_identifier', core.OctetString, {'optional': True}),
        ('sequence_number', core.Integer, {'optional': True}),
        ('this_update', x509.Time),
        ('next_update', x509.Time, {'optional': True}),
        ('subject_algorithm', algos.DigestAlgorithm),
        ('trusted_subjects', TrustedSubjects, {'optional': True}),
        ('extensions', CTLExtensions, {'explicit': 0, 'optional': True}),
    ]

for stl in Path(root).rglob('*.stl'):
    signed = cms.ContentInfo.load(stl.read_bytes())['content']
    # Microsoft CTLs embed the SEQUENCE directly instead of wrapping it in an OCTET STRING
    ctl = CertificateTrustList.load(parser.emit(0, 1, 16, signed['encap_content_info']['content'].contents))
    out = {
        'ctl': ctl.native,
        'certificates': [c.chosen.subject.human_friendly for c in signed['certificates']],
    }
    with open(f'{stl}.json', 'w') as f:
        json.dump(out, f, indent=2, default=lambda o: o.hex() if isinstance(o, bytes) else str(o))

with open(update_id_file, 'w') as f:
    f.write(updateId)
