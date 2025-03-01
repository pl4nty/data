import sys
import requests
import json

def fetch_and_prettify_json(url, output_file):
    try:
        # Fetching JSON data from the URL
        response = requests.get(url)
        response.raise_for_status()
        json_data = response.json()

        # Prettifying JSON data
        pretty_json = json.dumps(json_data, indent=4, sort_keys=True)

        # Writing prettified JSON to the specified file
        with open(output_file, 'w') as file:
            file.write(pretty_json)
        
        print(f"Prettified JSON has been written to {output_file}")
    
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from URL: {e}")
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python json.py <URL> <output_file>")
    else:
        url = sys.argv[1]
        output_file = sys.argv[2]
        fetch_and_prettify_json(url, output_file)
