#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup
import json
import re
import os
import time
import argparse
import signal
import sys
from concurrent.futures import ThreadPoolExecutor

# Base URL for Microsoft Download Center
BASE_URL = "https://www.microsoft.com/en-us/download/details.aspx?id="

# Headers with specified user agent
HEADERS = {
    "User-Agent": "curl/7.74"
    # "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0",
    # "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
    # "Accept-Language": "en-US,en;q=0.9"
}

# Global variables for tracking and handling termination
should_terminate = False
collected_results = 0


def signal_handler(sig, frame):
    """Handle interrupt signals gracefully by setting a flag to stop processing"""
    global should_terminate
    print("\nReceived termination signal. Completing current tasks and saving results...")
    should_terminate = True
    # Don't exit immediately, let the main loop handle the termination


def save_individual_json(id_num, json_data, output_dir='.'):
    """
    Save JSON data to individual files organized by ID ranges of 5000.
    
    The file structure will be:
    output_dir/microsoft-download-center/{batch_folder}/{id}.json
    
    Where batch_folder is calculated as: floor(id / 5000)
    """
    # Calculate the batch folder
    batch_folder = str(id_num // 5000)
    
    # Create the directory path
    base_dir = os.path.join(output_dir, "microsoft-download-center")
    batch_dir = os.path.join(base_dir, batch_folder)
    os.makedirs(batch_dir, exist_ok=True)
    
    # Create the file path - ID.json
    file_path = os.path.join(batch_dir, f"{id_num}.json")
    
    # Save the JSON data
    with open(file_path, 'w') as f:
        json.dump(json_data, f, indent=4)
    
    return file_path


def extract_json_from_page(html_content):
    """
    Extract the __DLCDetails__ JSON data from a Microsoft Download page.
    """
    soup = BeautifulSoup(html_content, 'html.parser')

    # Find script tags that might contain the __DLCDetails__ JSON
    script_tags = soup.find_all('script')
    for script in script_tags:
        if script.string and '__DLCDetails__' in script.string:
            # Use regex to extract the JSON data between window.__DLCDetails__= and </script>
            match = re.search(
                r'<script>window\.__DLCDetails__=(\{.*\})</script>',
                str(script), re.DOTALL)

            if match:
                try:
                    # Extract and parse the JSON
                    json_str = match.group(1)
                    json_data = json.loads(json_str)['dlcDetailsView']
                    if 'seoString' in json_data:
                        del json_data['seoString']
                    if 'localizedText' in json_data:
                        del json_data['localizedText']
                    for key in list(json_data.keys()):
                      if key.startswith('banner'):
                        del json_data[key]
                    return json_data
                except json.JSONDecodeError as e:
                    print(f"Failed to parse JSON data: {e}")

    return None


def fetch_download_page(id_num, output_dir='.'):
    """
    Fetch a Microsoft Download page by ID and extract its JSON data if successful.
    """
    url = f"{BASE_URL}{id_num}"
    try:
        # Make request with user agent header and don't follow redirects
        response = requests.get(url, headers=HEADERS,
                                timeout=30, allow_redirects=False)

        # Check if we got a redirect
        if response.status_code in [301, 302, 303, 307, 308]:
            redirect_url = response.headers.get('Location', '')
            if (redirect_url != "https://www.microsoft.com/en-us/download/404Error.aspx"):
                print(
                    f"ID {id_num}: Invalid - Redirect ({response.status_code}) to {redirect_url}")
            return id_num, None

        # If we got a 200 response, check for __DLCDetails__ in the content
        if response.status_code == 200:
            if '__DLCDetails__' in response.text:
                print(f"ID {id_num}: Valid download page found")

                # Extract JSON data from the page
                json_data = extract_json_from_page(response.text)

                if json_data:
                    # Make sure the ID is part of the JSON data
                    if 'detailsId' not in json_data:
                        json_data['detailsId'] = str(id_num)
                    
                    print(f"ID {id_num}: JSON data extracted")
                    return id_num, json_data
                else:
                    print(
                        f"ID {id_num}: Found __DLCDetails__ marker but couldn't extract JSON")
                    return id_num, None
            else:
                print(
                    f"ID {id_num}: Invalid - Status 200 but no download details found")
                return id_num, None
        else:
            print(f"ID {id_num}: Failed - Status {response.status_code}")
            return id_num, None

    except requests.exceptions.RequestException as e:
        print(f"ID {id_num}: Request error: {str(e)}")
        return id_num, None
    except Exception as e:
        print(f"ID {id_num}: Error: {str(e)}")
        return id_num, None


def process_range(start_id, end_id, num_threads=10, delay=0.5, output_dir='.'):
    """
    Process a range of Microsoft Download page IDs.
    """
    global collected_results, should_terminate

    # Create the base directory for individual files
    base_dir = os.path.join(output_dir, "microsoft-download-center")
    os.makedirs(base_dir, exist_ok=True)
    
    existing_ids = set()

    # First check for individual files
    print("Scanning for existing individual JSON files...")
    individual_files_count = 0
    
    # Calculate the range of batch folders we need to check
    start_batch = start_id // 5000
    end_batch = end_id // 5000
    
    # Check each batch folder for existing files
    for batch in range(start_batch, end_batch + 1):
        batch_dir = os.path.join(base_dir, str(batch))
        if os.path.exists(batch_dir):
            for file in os.listdir(batch_dir):
                if file.endswith('.json') and file != "microsoft_download_center.json":
                    try:
                        file_id = int(file.split('.')[0])
                        if start_id <= file_id <= end_id:
                            existing_ids.add(file_id)
                            individual_files_count += 1
                    except (ValueError, IndexError):
                        continue
    
    print(f"Found {individual_files_count} existing IDs")

    collected_results = 0
    failed_count = 0

    print(
        f"Starting to enumerate Microsoft download pages from ID {start_id} to {end_id}")
    # Skip IDs that we already have
    ids_to_process = [id_num for id_num in range(
        start_id, end_id + 1) if id_num not in existing_ids]
    print(f"Processing {len(ids_to_process)} IDs (skipping {len(range(start_id, end_id + 1)) - len(ids_to_process)} already collected)")

    try:
        with ThreadPoolExecutor(max_workers=num_threads) as executor:
            future_to_id = {}

            # Submit initial batch of tasks
            batch_size = min(num_threads * 2, len(ids_to_process))
            for id_num in ids_to_process[:batch_size]:
                future = executor.submit(
                    fetch_download_page, id_num, output_dir)
                future_to_id[future] = id_num

            processed_count = batch_size
            completed_futures = set()

            # Process results and submit new tasks as long as there are pending futures
            # or remaining IDs to process
            while future_to_id or processed_count < len(ids_to_process):
                # Check for completed futures
                done_futures = {f for f in future_to_id if f.done()}

                # Process completed futures
                for future in done_futures - completed_futures:
                    completed_futures.add(future)
                    id_num = future_to_id[future]

                    try:
                        _, json_data = future.result()
                        if json_data:
                            # Increment collected results
                            collected_results += 1
                            # Save as individual file
                            file_path = save_individual_json(id_num, json_data, output_dir)
                            print(f"ID {id_num}: Saved to {file_path}")
                        else:
                            failed_count += 1
                    except Exception as e:
                        print(
                            f"Error processing result for ID {id_num}: {str(e)}")
                        failed_count += 1

                # Check if we should terminate
                if should_terminate:
                    print("Termination requested. Stopping submission of new tasks.")
                    break

                # Submit new tasks if available
                for id_num in ids_to_process[processed_count:processed_count + len(done_futures)]:
                    if should_terminate:
                        break
                    future = executor.submit(
                        fetch_download_page, id_num, output_dir)
                    future_to_id[future] = id_num
                    processed_count += 1
                    # Add a small delay to avoid overwhelming the server
                    time.sleep(delay)

                # Remove completed futures from tracking
                for f in completed_futures:
                    if f in future_to_id:
                        del future_to_id[f]

                # Short sleep to prevent CPU spinning
                time.sleep(0.1)

    except KeyboardInterrupt:
        print("\nKeyboard interrupt received. Saving current results...")
        should_terminate = True

    finally:
        total_processed = collected_results + failed_count

        print(f"\nSummary:")
        print(
            f"Total IDs processed in this run: {total_processed} of {len(ids_to_process)} planned")
        print(f"New successful pages: {collected_results}")
        print(f"Failed pages in this run: {failed_count}")
        print(f"Results saved to individual files in {base_dir} organized by ID ranges of 5000")


if __name__ == "__main__":
    # Register signal handler for SIGINT (Ctrl+C)
    signal.signal(signal.SIGINT, signal_handler)

    parser = argparse.ArgumentParser(
        description='Enumerate Microsoft download pages by ID')
    parser.add_argument('--start', type=int, default=1,
                        help='Starting ID number')
    parser.add_argument('--end', type=int, default=100,
                        help='Ending ID number')
    parser.add_argument('--threads', type=int, default=25,
                        help='Number of threads to use (default: 25)')
    parser.add_argument('--delay', type=float, default=0.1,
                        help='Delay between requests in seconds (default: 0.1)')
    parser.add_argument('--output-dir', type=str, default='.',
                        help='Directory to save JSON files (default: current directory)')

    args = parser.parse_args()

    # Create output directory if it doesn't exist
    os.makedirs(args.output_dir, exist_ok=True)
    process_range(args.start, args.end, args.threads,
                  args.delay, args.output_dir)
