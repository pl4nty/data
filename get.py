import sys
import requests
import json
import xml.dom.minidom
from azure.identity import DefaultAzureCredential


def fetch_and_prettify_json(url, output_file, key=None, headers=None):
    try:
        # Fetching JSON data from the URL
        try:
            response = requests.get(url, headers=headers)
        except requests.exceptions.SSLError as e:
            response = requests.get(url, verify=False, headers=headers)

        response.raise_for_status()
        json_data = response.json()

        if key is not None:
            json_data = json_data[key]

        # Prettifying JSON data
        if isinstance(json_data, dict):
            json_data.pop("ConfigIDs", None)
            json_data.pop("ExternalIpAddress", None)
            json_data.pop("Headers", None)
        pretty_json = json.dumps(json_data, indent=4, sort_keys=True)

        # Writing prettified JSON to the specified file
        with open(output_file, 'w') as file:
            file.write(pretty_json)

        print(f"Prettified JSON has been written to {output_file}")
    # except requests.exceptions.RequestException as e:
    #     print(f"Error fetching data from URL: {e}")
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON: {e}")


def fetch_and_prettify_xml(url, output_file):
    try:
        # Fetching XML data from the URL
        response = requests.get(url)
        response.raise_for_status()
        xml_data = response.text

        # Parsing XML data
        dom = xml.dom.minidom.parseString(xml_data)

        # microsoft_office_serverconfig16.json: remove the 'o:GenerationTime' attribute if it exists
        services_element = dom.getElementsByTagName('o:services')[0]
        if services_element.hasAttribute('o:GenerationTime'):
            services_element.removeAttribute('o:GenerationTime')

        # Writing prettified XML to the specified file
        # pretty_xml = dom.toprettyxml()
        pretty_xml = dom.toxml()
        with open(output_file, 'w') as file:
            file.write(pretty_xml)

        print(f"Prettified XML has been written to {output_file}")

    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from URL: {e}")
    except xml.parsers.expat.ExpatError as e:
        print(f"Error parsing XML: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        # Experimentation and Configuration Service
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/Edge/131.0.2903.112?osname=win&client=edge&channel=stable&osarch=x86_64&devicefamily=desktop&uma=0&sessionid=152&mngd=0&installdate=1694958418&edu=0&bphint=2&fg=1", "ecs/Edge.json")
        # fetch_and_prettify_json(
        #     "https://ecs.office.com/config/v1/Intune/1.0.0.0", "ecs/Intune.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/CMD/1.0.0.0?Environment=SH&tenantId=77274a75-f318-4f60-b319-57d7e3012825", "ecs/CMD_sh.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/CMD/1.0.0.0?Environment=TEST&tenantId=77274a75-f318-4f60-b319-57d7e3012825", "ecs/CMD_test.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/CMD/1.0.0.0?Environment=PROD&tenantId=77274a75-f318-4f60-b319-57d7e3012825", "ecs/CMD_prod.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/OneShell/1.0.0.0?IsConsumer=false&UserId=3387110e-a323-4cf4-8925-055e2d149b43", "ecs/OneShell.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/LokiService/1.0.0.0?ClientWorkload=M365AdminCenter&id=3387110e-a323-4cf4-8925-055e2d149b43&TenantID=77274a75-f318-4f60-b319-57d7e3012825&ring=Prod&ApEnvironment=Prod", "ecs/LokiService.json")
        # fetch_and_prettify_json(
        #     "https://ecs.office.com/config/v1/Skype/1.0.0.0?AudienceGroup=ring0&Debug=false&TenantID=77274a75-f318-4f60-b319-57d7e3012825&Environment=prod", "ecs/Skype.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/MicrosoftTeams/1.0.0.0?TenantID=77274a75-f318-4f60-b319-57d7e3012825", "ecs/MicrosoftTeams.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/MicrosoftWindowsDefenderClient/1.0.0.0", "ecs/MicrosoftWindowsDefenderClient.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/CHILL/1.0.0.0", "ecs/CHILL.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/Designer/1.0.0.0", "ecs/Designer.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/ODSP_Sync_Client/1.0.0.0", "ecs/ODSP_Sync_Client.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/PortalsMakerExperiences/1.0.0.0", "ecs/PortalsMakerExperiences.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/RemoteAssist/1.0", "ecs/RemoteAssist.json")
        # fetch_and_prettify_json(
        #     "https://ecs.office.com/config/v1/SCOM/1.0.0.0", "ecs/SCOM.json")
        # fetch_and_prettify_json(
        #     "https://ecs.office.com/config/v1/SkypeLyncWebExperience/1.0.0.0", "ecs/SkypeLyncWebExperience.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/SkypeElectronWrapper/1.0.0.0", "ecs/SkypeElectronWrapper.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/AuthClientAndroid/1.0.0.0", "ecs/AuthClientAndroid.json")
        fetch_and_prettify_json(
            "https://ecs.office.com/config/v1/EdgeUpdate/1.0.0.0", "ecs/EdgeUpdate.json")

        fetch_and_prettify_json(
            "https://api.steampowered.com/ISteamApps/GetSDRConfig/v1?appid=440", "network_config_tf2.json")

        # TODO decode https://login.microsoftonline.com/common/kerberos
        fetch_and_prettify_json(
            "https://login.microsoftonline.com/common/discovery/instance?api-version=1.1&authorization_endpoint=https://login.microsoftonline.com/common/oauth2/v2.0/authorize", "microsoft_instance_discovery.json")
        fetch_and_prettify_json(
            "https://login.microsoftonline.com/common/.well-known/openid-configuration", "microsoft_oidc_config.json")
        fetch_and_prettify_json(
            "https://login.windows-ppe.net/common/.well-known/openid-configuration", "microsoft_oidc_config_ppe.json")

        # JWKS keys now rotate every 12 hours
        # fetch_and_prettify_json("https://login.microsoftonline.com/common/discovery/keys", "microsoft_jwks.json", "keys")
        # fetch_and_prettify_json("https://login.microsoftonline.us/common/discovery/keys", "microsoft_jwks_us.json", "keys")
        # fetch_and_prettify_json("https://login.partner.microsoftonline.cn/common/discovery/keys", "microsoft_jwks_cn.json", "keys")
        # fetch_and_prettify_json(
        #     "https://login.windows-ppe.net/common/discovery/keys", "microsoft_jwks_ppe.json", "keys")

        fetch_and_prettify_json(
            "https://www.microsoft.com/releasecommunications/api/v1/m365", "microsoft_365_roadmap.json")

        fetch_and_prettify_json(
            "https://zoom.us/rest/download?os=win", "Zoom.json")

        fetch_and_prettify_xml(
            "https://officeclient.microsoft.com/serverconfig16", "microsoft_office_serverconfig16.json")

        fetch_and_prettify_json(
            "https://endpoints.office.com/endpoints/worldwide?clientrequestid=bfefa92b-5f67-46b7-b01a-f3f80672645c", "microsoft_endpoints.json")
        fetch_and_prettify_json(
            "https://endpoints.office.com/endpoints/worldwide?serviceareas=MEM&clientrequestid=bfefa92b-5f67-46b7-b01a-f3f80672645c", "microsoft_endpoints_intune.json")

        fetch_and_prettify_json(
            "https://geo.int.do.dsp.mp.microsoft.com/geo", "microsoft_delivery_geo_int.json")
        fetch_and_prettify_json(
            "https://kv201.int.do.dsp.mp.microsoft.com/all?doClientVersion=10.1.0.13", "microsoft_delivery_kv_int.json")
        fetch_and_prettify_json(
            "https://kv501.prod.do.dsp.mp.microsoft.com/all?doClientVersion=10.10.0.13", "microsoft_delivery_kv_prod.json")

        # https://prod.api.toolbox.azure-test.net/api/tool/Microsoft/DataBoxEdge/1.1.0/artifact/Az.DataBoxEdge.zip
        fetch_and_prettify_json(
            "https://prod.api.toolbox.azure-test.net/api/tool", "microsoft_gov_toolbox.json")

        fetch_and_prettify_json(
            "https://learn.microsoft.com/en-us/product-style-guide-msft-internal/toc.json", "microsoft_style_guide.json")

        fetch_and_prettify_json(
            "https://main.vscode-cdn.net/extensions/marketplace.json", "microsoft_vscode_marketplace.json")

        fetch_and_prettify_json(
            "https://management.azure.com/metadata/endpoints?api-version=2022-09-01", "microsoft_azure_endpoints.json")

        creds = DefaultAzureCredential()
        headers = {
            "Authorization": f"Bearer {creds.get_token('https://management.azure.com//.default').token}"}
        # non-deterministic?
        # fetch_and_prettify_json("https://management.azure.com/subscriptions/8e8bbf73-03c1-44da-a079-6db5df3c079d/providers?api-version=2021-04-01",
        #                         "microsoft_azure_providers.json", headers=headers)
    else:
        url = sys.argv[1]
        output_file = sys.argv[2]
        fetch_and_prettify_json(url, output_file)
