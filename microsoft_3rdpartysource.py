import copy
import json
import os
import requests
from packaging import version
import subprocess
import shutil
import tempfile
from pathlib import Path
from dotenv import load_dotenv
from remotezip import RemoteZip
import time
from urllib.parse import urlparse
from azure.storage.blob import ContainerClient, BlobClient
from zipfile import ZipFile
import py7zr
import tarfile
import xml.etree.ElementTree as ET
import fnmatch
load_dotenv()


def get_3rdparty_data():
    url = "https://3rdpartysource.microsoft.com/downloads"
    response = requests.get(url)
    return response.json()


def save_json(data, filename):
    # Remove 'url' field from each item
    filtered = copy.deepcopy(data)
    for item in filtered:
        if 'url' in item:
            item.pop('url')

    with open(filename, 'w') as f:
        json.dump(filtered, f, indent=2)


def get_latest_edge_release(data):
    edge_releases = [
        item for item in data if item['product'] == 'Microsoft Edge' and item['dependency'] == 'chromium' and item['platform'] == 'Windows x64']

    def parse_version(ver_str):
        # Remove any suffix after hyphen (like -canary) for version comparison
        base_version = ver_str.split('-')[0]
        return version.parse(base_version)

    return max(edge_releases, key=lambda x: parse_version(x['release']))


def get_latest_hsm_release(data):
    hsm_releases = [
        item for item in data
        if item['product'] == 'Azure Cloud HSM'
        and 'e2etests' in item.get('dependency', '').lower()
    ]

    def parse_version(ver_str):
        # Handle 'x' in version strings by converting to 0
        cleaned_version = ver_str.split('-')[0].replace('x', '0')
        return version.parse(cleaned_version)

    return max(hsm_releases, key=lambda x: parse_version(x['release']))


def get_latest_sphere_release(data):
    sphere_releases = [
        item for item in data
        if item['product'] == 'Azure Sphere'
        and item.get('dependency', '').lower() == 'core os components'
    ]

    def parse_version(ver_str):
        cleaned_version = ver_str.split('-')[0].replace('x', '0')
        return version.parse(cleaned_version)

    return max(sphere_releases, key=lambda x: parse_version(x['release']))


def get_latest_sphere_linux_release(data):
    linux_releases = [
        item for item in data
        if item['product'] == 'Azure Sphere'
        and item.get('dependency', '').lower() == 'linux kernel'
    ]

    def parse_version(ver_str):
        cleaned_version = ver_str.split('-')[0].replace('x', '0')
        return version.parse(cleaned_version)

    return max(linux_releases, key=lambda x: parse_version(x['release']))


def get_latest_electron_release(data):
    electron_releases = [
        item for item in data
        if item['product'] == 'Microsoft Electron'
        and item['platform'] == 'Windows'
    ]

    def parse_electron_version(ver_str):
        base_version = ver_str.split('@')[0]
        return version.parse(base_version)
    return max(electron_releases, key=lambda x: parse_electron_version(x['release']))


def read_local_json(filename):
    try:
        with open(filename, 'r') as f:
            return json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        return None


def ensure_azcopy():
    if shutil.which('azcopy'):
        return True

    print("Installing azcopy...")
    with tempfile.TemporaryDirectory() as temp_dir:
        # Download azcopy
        azcopy_tar = os.path.join(temp_dir, 'azcopy.tar.gz')
        subprocess.run([
            'wget',
            'https://aka.ms/downloadazcopy-v10-linux',
            '-O', azcopy_tar
        ], check=True)

        # Extract
        subprocess.run(['tar', '-xzf', azcopy_tar, '-C', temp_dir], check=True)

        # Find azcopy binary in extracted contents
        azcopy_binary = next(Path(temp_dir).rglob('azcopy'))

        # Install to /usr/local/bin
        target_path = '/usr/local/bin/azcopy'
        subprocess.run(
            ['sudo', 'cp', str(azcopy_binary), target_path], check=True)
        subprocess.run(['sudo', 'chmod', '+x', target_path], check=True)

        print("azcopy installed successfully")
        return True


def copy_to_azure_storage(source_url, destination_sas_url):
    # why can azcopy do 10gbps but the python sdk can't?
    # https://github.com/Azure/azure-sdk-for-python/issues/24293
    if not ensure_azcopy():
        raise RuntimeError("Failed to ensure azcopy is available")

    try:
        result = subprocess.run(
            ['azcopy', 'copy', source_url, destination_sas_url],
            capture_output=True,
            text=True,
            check=True
        )
        print("azcopy output:", result.stdout)
        return True
    except subprocess.CalledProcessError as e:
        print("azcopy failed!")
        print("stdout:", e.stdout)
        print("stderr:", e.stderr)
        print("exit code:", e.returncode)
        raise


def wait_for_unzip(out_sas_url, timeout=1800, check_interval=30):
    """Wait for background unzip to complete by polling directory"""
    start_time = time.time()
    container_client = ContainerClient.from_container_url(out_sas_url)

    while time.time() - start_time < timeout:
        # List all blobs in directory
        blobs = list(container_client.list_blobs())
        if len(blobs) > 0:
            return True
        print("Waiting for unzip completion...")
        time.sleep(check_interval)

    raise TimeoutError("Unzip operation timed out")


def find_zip(sas_url):
    """Find the .zip file in the output directory"""
    container_client = ContainerClient.from_container_url(sas_url)
    parsed = urlparse(sas_url)

    for blob in container_client.list_blobs():
        if blob.name.endswith('.zip'):
            # Preserve the base path and append blob name
            zip_url = f"{parsed.scheme}://{parsed.netloc}{parsed.path}/{blob.name}?{parsed.query}"
            return zip_url

    return None


def should_extract_file(filename):
    """Determine if a file should be extracted based on patterns"""
    # Check for specific tool directories
    tool_patterns = [
        # Electron
        'src/microsoft/',

        # Edge
        'src/tools/win/msedgede/',
        'src/tools/win/msedgejs/',
        'src/tools/win/process_viewer/'
    ]
    return any(filename.startswith(pattern) for pattern in tool_patterns)


def download_zip_contents(zip_handle, exclude_paths=None, output_dir='msedge'):
    """Download ZIP contents excluding specified paths"""
    if exclude_paths is None:
        exclude_paths = []

    # Track total files for progress
    def should_include(filename):
        # First check if it's in excluded paths
        if any(filename.startswith(p) for p in exclude_paths):
            return False
        
        # Check for Edge features.h files
        if output_dir == 'msedge' and (filename.endswith('features.h') or filename.endswith('switches.h')):
            return True
        
        # Then check if it matches our extraction patterns
        return should_extract_file(filename)

    total_files = sum(1 for f in zip_handle.infolist()
                      if should_include(f.filename))
    processed_files = 0

    for file_info in zip_handle.infolist():
        if not should_include(file_info.filename):
            continue

        # Create full output path
        output_path = os.path.join(output_dir, file_info.filename)

        # Create parent directories if needed
        os.makedirs(os.path.dirname(output_path), exist_ok=True)

        # Extract file if it's not a directory
        if not file_info.is_dir():
            with zip_handle.open(file_info) as source, open(output_path, 'wb') as target:
                target.write(source.read())

            processed_files += 1
            if processed_files % 100 == 0:
                print(f"Downloaded {processed_files}/{total_files} files...")

    print(f"Downloaded {processed_files} files to {output_dir}/")


def extract_third_party_metadata(zip_handle: RemoteZip):
    """Extract metadata about third_party contents"""
    third_party = {}

    for file_info in zip_handle.infolist():
        if file_info.filename.startswith('src/third_party/'):
            parts = file_info.filename.split('/')
            if len(parts) > 3:  # src/third_party/name/...
                name = parts[2]
                if name not in third_party:
                    third_party[name] = {
                        'name': name,
                        'size': 0,
                        'file_count': 0
                    }
                third_party[name]['size'] += file_info.file_size
                third_party[name]['file_count'] += 1

    return sorted(third_party.values(), key=lambda x: x['name'].lower())


def delete_blob(blob_url):
    """Delete a blob using its URL"""
    try:
        blob_client = BlobClient.from_blob_url(blob_url)
        blob_client.delete_blob()
        print(f"Deleted blob: {blob_client.blob_name}")
        return True
    except Exception as e:
        print(f"Failed to delete blob: {e} for url {blob_url}")
        return False


def download_and_extract_hsm(url, output_dir='azure-cloud-hsm'):
    print(f"Downloading from {url}...")
    response = requests.get(url)

    with tempfile.TemporaryDirectory() as temp_dir:
        zip_path = Path(temp_dir) / "download.zip"
        zip_path.write_bytes(response.content)

        with ZipFile(zip_path) as zip_ref:
            seven_z_files = [
                f for f in zip_ref.namelist() if f.endswith('.7z')]
            if not seven_z_files:
                raise ValueError("No .7z file found in download")

            seven_z_path = Path(temp_dir) / seven_z_files[0]
            zip_ref.extract(seven_z_files[0], temp_dir)

            output_path = Path(output_dir)
            shutil.rmtree(output_path, ignore_errors=True)
            output_path.mkdir(exist_ok=True)

            print(f"Extracting {seven_z_files[0]} to {output_path}...")
            with py7zr.SevenZipFile(seven_z_path, 'r') as sz:
                # Filter files during extraction
                def should_extract(filename):
                    if 'node_modules' not in filename and not (filename.endswith('.js') or filename.endswith('.js.map')):
                        return True

                    return '@microsoft' in filename

                # Get filtered file list
                all_files = sz.getnames()
                files_to_extract = [f for f in all_files if should_extract(f)]

                # Extract filtered files
                sz.extract(path=output_path, targets=files_to_extract)


def download_and_extract_sphere(url, output_dir='azure-sphere'):
    print(f"Downloading from {url}...")
    response = requests.get(url)

    with tempfile.TemporaryDirectory() as temp_dir:
        # First extract the outer ZIP
        zip_path = Path(temp_dir) / "download.zip"
        zip_path.write_bytes(response.content)

        with ZipFile(zip_path) as zip_ref:
            # Find and extract the tar.gz
            targz_files = [
                f for f in zip_ref.namelist() if f.endswith('.tar.gz')]
            if not targz_files:
                raise ValueError("No .tar.gz file found in download")

            targz_path = Path(temp_dir) / targz_files[0]
            zip_ref.extract(targz_files[0], temp_dir)

            # Extract tar.gz contents, filtering unwanted directories
            output_path = Path(output_dir)
            output_path.mkdir(exist_ok=True)

            excluded_dirs = {'meta-mingw', 'meta-openembedded', 'poky'}

            print(f"Extracting {targz_files[0]} to {output_path}...")
            with tarfile.open(targz_path, 'r:gz') as tar:
                for member in tar.getmembers():
                    parts = member.name.split('/')
                    top_dir = parts[1] if len(parts) > 1 else None
                    if top_dir not in excluded_dirs:
                        tar.extract(member, output_path)


def parse_geopol_folders(xml_content):
    """Extract include folder paths from GeoPol XML"""
    root = ET.fromstring(xml_content)
    include_patterns = []

    # Find all IncludeFolder elements
    for folder in root.findall(".//Component/IncludeFolder"):
        if folder.text:
            # Convert Windows path separators to Unix style
            pattern = folder.text.strip().replace('\\', '/')
            include_patterns.append(pattern)

    return include_patterns


def should_extract_linux_file(filepath, include_patterns):
    """Check if file matches any include pattern"""
    for pattern in include_patterns:
        # Handle glob patterns
        if '*' in pattern:
            if fnmatch.fnmatch(filepath, pattern):
                return True
        # Handle exact directory matches
        elif filepath.startswith(pattern):
            return True
    return False


def download_and_extract_sphere_linux(url, output_dir='azure-sphere/linux'):
    print(f"Downloading Linux kernel from {url}...")
    response = requests.get(url)

    with tempfile.TemporaryDirectory() as temp_dir:
        zip_path = Path(temp_dir) / "download.zip"
        zip_path.write_bytes(response.content)

        with ZipFile(zip_path) as zip_ref:
            # Find and extract tar.gz
            targz_files = [
                f for f in zip_ref.namelist() if f.endswith('.tar.gz')]
            if not targz_files:
                raise ValueError("No .tar.gz file found in download")

            targz_path = Path(temp_dir) / targz_files[0]
            zip_ref.extract(targz_files[0], temp_dir)

            # Extract GeoPol.xml and get include patterns
            with tarfile.open(targz_path, 'r:gz') as tar:
                geopol_member = None
                for member in tar.getmembers():
                    if member.name.endswith('/GeoPol.xml'):
                        geopol_member = member
                        break

                if not geopol_member:
                    raise ValueError("No GeoPol.xml found in tar.gz")

                # Extract and parse GeoPol.xml
                xml_content = tar.extractfile(geopol_member).read()
                include_patterns = parse_geopol_folders(xml_content)
                include_patterns.append('.kernel-meta')
                include_patterns.append('az-sphere-os-sdk.yaml')
                include_patterns.append('azure-pipelines.yml')
                include_patterns.append('GeoPol.xml')
                include_patterns.append('servicetreeconfig.txt')
                print(
                    f"Found {len(include_patterns)} include patterns in GeoPol.xml")

                # Extract filtered contents
                output_path = Path(output_dir)
                shutil.rmtree(output_path, ignore_errors=True)
                output_path.mkdir(parents=True, exist_ok=True)

                print(f"Extracting filtered contents to {output_path}...")
                for member in tar.getmembers():
                    parts = Path(member.name).parts
                    relative_path = '/'.join(parts)
                    if should_extract_linux_file(relative_path, include_patterns):
                        tar.extract(member, output_path)


def main():
    # unzip service using blobs and function trigger. legacy polling-based trigger with up to 15 mins latency
    in_sas_url = os.getenv('AZURE_STORAGE_IN')
    if not in_sas_url:
        raise ValueError(
            "AZURE_STORAGE_IN environment variable not set")
    out_sas_url = os.getenv('AZURE_STORAGE_OUT')
    if not out_sas_url:
        raise ValueError("AZURE_STORAGE_OUT environment variable not set")
    
    # latest_electron = {'url': 'https://3rdpartycodeprod.blob.core.windows.net/download/Microsoft%20Electron/35.0.1%40e2f3b486/Windows/microsoft-electron-v35.0.1-e2f3b48605f133115358cb59af57f202687665ed-windows.zip?sv=2021-12-02&st=2025-03-15T12%3A40%3A43Z&se=2025-03-15T14%3A20%3A43Z&sr=b&sp=r&sig=oSLunjT3k2shNeBIJjEYsLCe6lz7Se%2BGQ4uUqG4B4lE%3D'}
    data = get_3rdparty_data()
    save_json(data, 'microsoft_3rdpartysource.json')

    # Microsoft Edge for Windows
    # start long-running extraction before other workloads
    latest_edge = get_latest_edge_release(data)
    print(f"Latest Edge version: {latest_edge['release']}")
    source_url = latest_edge['url']
    success = copy_to_azure_storage(source_url, in_sas_url)
    print(f"Copy operation {'succeeded' if success else 'failed'}")

    # Azure Sphere kernel
    latest_linux = get_latest_sphere_linux_release(data)
    print(f"\nLatest Sphere Linux version: {latest_linux['release']}")
    download_and_extract_sphere_linux(latest_linux['url'])
    print("Linux kernel extraction completed")

    # Azure Sphere core
    latest_sphere = get_latest_sphere_release(data)
    print(f"\nLatest Sphere version: {latest_sphere['release']}")
    download_and_extract_sphere(latest_sphere['url'])
    print("Sphere download and extraction completed")

    # Azure Cloud HSM e2etests
    latest_hsm = get_latest_hsm_release(data)
    print(f"Latest HSM version: {latest_hsm['release']}")
    download_and_extract_hsm(latest_hsm['url'])
    print("HSM download and extraction completed")
    
    # Microsoft Electron for Windows
    # zip isn't nested so we carve directly. pretty slow from Aus but fast on GHA
    latest_electron = get_latest_electron_release(data)
    print(f"Latest Electron version: {latest_electron['release']}")
    zip_url = latest_electron['url']

    try:
        # Process ZIP contents
        print(f"\nProcessing ZIP: {zip_url}")
        with RemoteZip(zip_url, support_suffix_range=False) as zip:
            shutil.rmtree('mselectron', ignore_errors=True)
            os.makedirs('mselectron', exist_ok=True)

            # Extract metadata and files
            metadata = extract_third_party_metadata(zip)
            with open('mselectron/third_party.json', 'w') as f:
                json.dump(metadata, f, indent=2)
            print(f"Saved metadata for {len(metadata)} third_party components")

            print("\nDownloading files...")
            download_zip_contents(zip, exclude_paths=['src/third_party', 'src/microsoft/src/third_party/ffmpeg'], output_dir='mselectron')

    except Exception as e:
        print(f"Error during ZIP processing: {e}")

    # exit()

    # Wait for Edge extraction to complete
    print("Waiting for unzip operation to complete...")
    if wait_for_unzip(out_sas_url):
        print("Unzip completed")
        # Delete parent ZIP after unzip
        zip_url = find_zip(in_sas_url)
        if delete_blob(zip_url):
            print("Deleted parent ZIP after unzip")

    # Find the ZIP file in output directory
    zip_url = find_zip(out_sas_url)
    if not zip_url:
        raise ValueError("Could not find zip in output directory")

    try:
        # Process ZIP contents
        print(f"\nProcessing ZIP: {zip_url}")
        with RemoteZip(zip_url, support_suffix_range=False) as zip:
            shutil.rmtree('msedge', ignore_errors=True)
            os.makedirs('msedge', exist_ok=True)

            # Extract metadata and files
            metadata = extract_third_party_metadata(zip)
            with open('msedge/third_party.json', 'w') as f:
                json.dump(metadata, f, indent=2)
            print(f"Saved metadata for {len(metadata)} third_party components")

            print("\nDownloading files...")
            download_zip_contents(zip, exclude_paths=[
                                  'src/out', 'src/third_party'])

        # Delete child ZIP after successful processing
        if delete_blob(zip_url):
            print("Deleted child ZIP after processing")

    except Exception as e:
        print(f"Error during ZIP processing: {e}")
        raise


if __name__ == "__main__":
    main()
