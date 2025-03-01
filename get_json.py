import sys
import requests
import json

def fetch_and_prettify_json(url, output_file, key=None):
    try:
        # Fetching JSON data from the URL
        response = requests.get(url)
        response.raise_for_status()
        json_data = response.json()

        if key is not None:
            json_data = json_data[key]

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
        fetch_and_prettify_json("https://api.steampowered.com/ISteamApps/GetSDRConfig/v1?appid=440", "network_config_tf2.json")
        fetch_and_prettify_json("https://login.microsoftonline.com/common/discovery/instance?api-version=1.1&authorization_endpoint=https://login.microsoftonline.com/common/oauth2/v2.0/authorize", "microsoft_instance_discovery.json")
        fetch_and_prettify_json("https://login.microsoftonline.com/common/.well-known/openid-configuration", "microsoft_oidc_config.json")
        fetch_and_prettify_json("https://login.windows-ppe.net/common/.well-known/openid-configuration", "microsoft_oidc_config_ppe.json")
        fetch_and_prettify_json("https://login.microsoftonline.com/common/discovery/keys", "microsoft_jwks.json", "keys")
        fetch_and_prettify_json("https://login.microsoftonline.us/common/discovery/keys", "microsoft_jwks_us.json", "keys")
        fetch_and_prettify_json("https://login.partner.microsoftonline.cn/common/discovery/keys", "microsoft_jwks_cn.json", "keys")
        fetch_and_prettify_json("https://login.windows-ppe.net/common/discovery/keys", "microsoft_jwks_ppe.json", "keys")
    else:
        url = sys.argv[1]
        output_file = sys.argv[2]
        fetch_and_prettify_json(url, output_file)
