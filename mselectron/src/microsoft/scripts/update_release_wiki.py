import os
import argparse
import re
import xml.etree.ElementTree as ET


def parse_args():
    parser = argparse.ArgumentParser(description="Update the homepage file.")
    parser.add_argument('--homepage', type=str, required=True, help="Path to the file to rewrite")
    parser.add_argument('--new-version', type=str, required=True, help="New version text, format 'X-Y-Z'")
    parser.add_argument('--base-url', type=str, required=True, help="Base URL for the new version")
    return parser.parse_args()

# Find the parent of a given element in the tree
def find_parent(root, target_element):
    for parent in root.iter():
        if target_element in list(parent):
            return parent
    return None

# Convert XML to HTML string and clean the output
def xml_to_clean_html(xml_root, file_path=None):
    updated_content = ET.tostring(xml_root, encoding='unicode', method='html')
    updated_content = updated_content.replace("&lt;", "<").replace("&gt;", ">")
    updated_content = updated_content.replace("<root>", "").replace("</root>", "")
    updated_content = updated_content.replace("\t", "  ")
    updated_content = updated_content.replace("<meta charset=\"UTF-8\">", "<meta charset=\"UTF-8\"></meta>")

    if file_path:
        with open(file_path, 'w', encoding='utf-8') as file:
            file.write(updated_content)

    return updated_content

def rewrite_file(file_path, new_version, base_url):
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"File '{file_path}' does not exist.")

    # Read the original contents
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()

    # Wrap the content in a root element to ensure proper parsing
    wrapped_content = f"<root>{content}</root>"
    tree = ET.ElementTree(ET.fromstring(wrapped_content))
    root = tree.getroot()

    # Prepare the new version details to fill in blocks
    base_ver = "v" + new_version.split('-')[0]
    ul_id = base_ver + "-list"
    latest_id = base_ver + "-latest"
    new_version_dots = new_version.replace('-', '.')
    new_html_content = f'<a href="{base_url}/{new_version}.html">{new_version_dots}</a>'

    # Define the tools for formatting blocks
    pattern = r'^\d+-0-0$'
    no_longer_supported_header = None
    previous_details = None
    body = None
    lvl_zero = "\n\t\t\t\t"
    lvl_one = lvl_zero + "\t"
    lvl_two = lvl_one + "\t"

    # Create a new block if the release is a new major version
    if re.match(pattern, new_version):
        for elem in root.iter():
            if elem.tag == "h3":
                # Add new release block under the "Currently Supported" section
                if elem.attrib.get("id") == "currently-supported":
                    details = ET.Element("details", id=base_ver)
                    details.text = lvl_one
                    details.tail = "\n" + lvl_zero
                    summary = ET.Element("summary", id=latest_id)
                    summary.text = base_ver + " Latest " + new_html_content
                    summary.tail = lvl_one
                    ul = ET.Element("ul", id=ul_id)
                    ul.text = lvl_two
                    ul.tail = lvl_zero
                    
                    li = ET.Element("li")
                    li.text = new_html_content
                    li.tail = lvl_one
                    ul.insert(0, li)

                    details.append(summary)
                    details.append(ul)

                    # Find the parent of the current element
                    body = find_parent(root, elem)
                    if body is None:
                        raise ValueError("Parent of the element not found.")

                    # Insert the new details block after the current element within its parent
                    body.insert(list(body).index(elem) + 1, details)

                if elem.attrib.get("id") == "no-longer-supported":
                    no_longer_supported_header = elem
                    break

            if elem.tag == "details":
                previous_details = elem

        # Move the "no-longer-supported" header before the previous <details> block
        if (no_longer_supported_header != None) and (previous_details != None):
            if body is None:
                raise ValueError("Parent of the element not found.")
            body.remove(no_longer_supported_header)
            body.insert(list(body).index(previous_details), no_longer_supported_header)

        # Clean up the html and write it back to the file
        xml_to_clean_html(root, file_path)
        return

    # For minor or patch releases, just add to the existing list
    target_ul = None
    target_latest = None
    for elem in root.iter():
        if elem.tag == "summary" and elem.attrib.get("id") == latest_id:
            target_latest = elem
        if elem.tag == "ul" and elem.attrib.get("id") == ul_id:
            target_ul = elem
            break

    if target_ul == None:
        raise ValueError("Element with id " + ul_id + " not found.")

    li = ET.Element("li")
    li.text = new_html_content
    target_ul.insert(0, li)
    li.tail = lvl_two

    # Update "Latest" to reflect new release version
    target_latest.clear()
    target_latest.set("id", latest_id)
    target_latest.text = base_ver + " Latest " + new_html_content
    target_latest.tail = lvl_one

    # Clean up the html and write it back to the file
    xml_to_clean_html(root, file_path)

def main():
    args = parse_args()
    rewrite_file(args.homepage, args.new_version, args.base_url)

if __name__ == '__main__':
    main()