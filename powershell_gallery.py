import requests
import os
import zipfile
import io
import shutil
import concurrent.futures

MODULES = [
    'MicrosoftTeams',
    'CPC.DeployInfra'
]


def download_module(module_name):
    url = f"https://www.powershellgallery.com/api/v2/package/{module_name}"
    response = requests.get(url)
    response.raise_for_status()
    return response.content


def is_powershell_file(filename):
    extensions = ('.ps1', '.psm1', '.ps1xml', '.psd1')
    return filename.lower().endswith(extensions)


def strip_signature(file_path):
    # Try different encodings
    encodings = ['ascii', 'utf-8', 'utf-8-sig', 'utf-16', 'cp1252']

    for encoding in encodings:
        try:
            with open(file_path, 'r', encoding=encoding) as f:
                content = f.read()

            if 'SIG # Begin signature block' in content:
                header, _, signature = content.partition(
                    'SIG # Begin signature block')
                sig_header = signature.split('\n')[0]
                with open(file_path, 'w', encoding=encoding) as f:
                    f.write(header + 'SIG # Begin signature block' +
                            '\n' + sig_header)
            return
        except UnicodeError:
            continue
        except Exception as e:
            print(f"Warning: Could not process {file_path}: {e}")
            return


def extract_module(content, module_name):
    output_dir = os.path.join('powershell-gallery', module_name)
    os.makedirs(output_dir, exist_ok=True)

    with zipfile.ZipFile(io.BytesIO(content)) as zip_ref:
        zip_ref.extractall(output_dir)

    # Strip signatures from PowerShell files
    for root, _, files in os.walk(output_dir):
        for file in files:
            if is_powershell_file(file):
                file_path = os.path.join(root, file)
                strip_signature(file_path)

    return output_dir


def process_module(module_name):
    try:
        print(f"Downloading {module_name}...")
        content = download_module(module_name)

        print("Extracting module contents...")
        output_dir = extract_module(content, module_name)
        print(f"Module extracted to: {output_dir}")
        return True
    except requests.exceptions.RequestException as e:
        print(f"Error downloading module {module_name}: {e}")
        return False


def main():
    shutil.rmtree('powershell-gallery', ignore_errors=True)
    os.makedirs('powershell-gallery', exist_ok=True)

    with concurrent.futures.ProcessPoolExecutor() as executor:
        results = executor.map(process_module, MODULES)

    # Check if all modules were processed successfully
    if not all(results):
        exit(1)


if __name__ == '__main__':
    main()
