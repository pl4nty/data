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
from urllib.parse import urlparse, unquote
from azure.storage.blob import ContainerClient, BlobClient
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


def wait_for_unzip(out_sas_url, timeout=600, check_interval=10):
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


def find_zip_in_output(out_sas_url):
    """Find the .zip file in the output directory"""
    container_client = ContainerClient.from_container_url(out_sas_url)
    parsed = urlparse(out_sas_url)

    for blob in container_client.list_blobs():
        if blob.name.endswith('.zip'):
            # Preserve the base path and append blob name
            zip_url = f"{parsed.scheme}://{parsed.netloc}{parsed.path}/{blob.name}?{parsed.query}"
            return zip_url

    return None


def should_extract_file(filename):
    """Determine if a file should be extracted based on patterns"""
    # Check for features.h files
    if filename.endswith('features.h'):
        return True

    # Check for specific tool directories
    tool_patterns = [
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
                        'file_count': 0,
                        'last_modified': file_info.date_time
                    }
                third_party[name]['size'] += file_info.file_size
                third_party[name]['file_count'] += 1

    return list(third_party.values())


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


def main():
    data = get_3rdparty_data()
    save_json(data, 'microsoft_3rdpartysource.json')

    # Get latest Edge release
    latest_edge = get_latest_edge_release(data)
    print(f"Latest Edge version: {latest_edge['release']}")

    # Get destination SAS URL from environment
    dest_sas_url = os.getenv('AZURE_STORAGE_IN')
    if not dest_sas_url:
        raise ValueError(
            "AZURE_STORAGE_IN environment variable not set")

    # Perform server-side copy
    source_url = latest_edge['url']
    success = copy_to_azure_storage(source_url, dest_sas_url)
    print(f"Copy operation {'succeeded' if success else 'failed'}")

    # Wait for unzip completion
    out_sas_url = os.getenv('AZURE_STORAGE_OUT')
    if not out_sas_url:
        raise ValueError("AZURE_STORAGE_OUT environment variable not set")

    print("Waiting for unzip operation to complete...")
    if wait_for_unzip(out_sas_url):
        print("Unzip completed")
        # Delete parent ZIP after unzip
        if delete_blob(dest_sas_url):
            print("Deleted parent ZIP after unzip")

    # Find the ZIP file in output directory
    zip_url = find_zip_in_output(out_sas_url)
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
