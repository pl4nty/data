#!/usr/bin/env python3
# modified from https://github.com/xmpf/android-sec-bulletins/blob/master/android_bulletins_parser.py

import os
import re
import argparse
import requests

from typing import *
from bs4 import BeautifulSoup # type: ignore
from pprint import pprint
from collections import defaultdict

URL = 'https://source.android.com/security/bulletin'
NO_SECURITY_ISSUES_MSG = 'There are no security issues'

class BulletinEntry(object):
    BASE_URL = 'https://source.android.com'

    def __init__(self, bulletin_url: str, published_date: str, patch_level: str) -> None:
        self.bulletin_url = self.BASE_URL + bulletin_url
        self.published_date = published_date
        self.patch_level = patch_level

    def __str__(self) -> str:
        out = f'\n\033[32mBulletin URL: {self.bulletin_url}\033[0m\n'
        out += f'Published date: {self.published_date}\n'
        out += f'Patch Level: {self.patch_level}\n'
        return out

class BulletinEntryDetailed(object):
    
    def __init__(self, bulletin_entry: BulletinEntry, sections: Dict) -> None:
        self.bulletin_entry = bulletin_entry
        self.sections = sections
    
    def __str__(self) -> str:
        out = str(self.bulletin_entry)
        
        for section_header, section_data in self.sections.items():
            out += f'\n\033[31;1;4mSection: {section_header}\033[0m\n'
            for line in section_data:
                out += '\n'
                for a, b in line:
                    b = re.sub("\s+", " ", b)
                    out += f'{a}: {b}\n'
        return out

def extract_bulletins(html_parser: BeautifulSoup) -> List[BulletinEntry]:
    ''' extract bulletin info from main page '''
    bulletins_table = html_parser.find('table')
    if bulletins_table is None:
        raise Exception("Unable to find bulletins table...")

    bulletin_table_entries = []

    for row in bulletins_table.find_all('tr')[1:]:
        # each row has 4 columns
        columns = row.find_all('td')
        
        try:
            bulletin_url = columns[0].find('a').get('href')
            published_date = columns[2].get_text()
            patch_level = columns[3].get_text().split()

            bulletin_table_entries.append(BulletinEntry(bulletin_url, published_date, patch_level))
        except IndexError:
            pass
    
    return bulletin_table_entries
        
def extract_bulletin_sections(bulletin_entry: BulletinEntry) -> BulletinEntryDetailed:
    ''' extract detailed info from each bulletin '''
    sess = requests.Session()
    html_page = sess.get(url=bulletin_entry.bulletin_url)
    html_parser = BeautifulSoup(html_page.content, 'html.parser')

    table_headers_ref = html_parser.find_all('h3')[:-3]

    # System, Frameworks, ...
    table_headers = list(map(lambda x: x.get_text().strip(), table_headers_ref))

    table_descriptions = list(
        filter(
            lambda x: x != "",
            map(
                lambda x: x.next_sibling.replace('\n', ' ').strip()
                if x.next_sibling.text != '\n'
                else getattr(x.find_next_sibling('p'), "text", '').replace('\n', ' ').strip(),
                table_headers_ref,
            ),
        )
    )

    n_tables = 0
    sections = defaultdict(list)
    for t in table_headers_ref:

        table = t.find_next_sibling('table')

        # CVE, References, Type, Severity, ...
        column_titles = list(map(lambda x: x.get_text().strip(), table.find_all('th')))

        # find if empty field exist and remove it
        if column_titles.count(''):
            column_titles.remove('')

        for rows in table.find_all('tr')[1:]:
            entry = []
            n_cols = 0
            for column in rows.find_all('td'):
                # skip over the empty fields
                if column.text == '':
                    continue
            
                if table_descriptions[n_tables].startswith(NO_SECURITY_ISSUES_MSG):
                    n_cols += 1
                    continue

                entry.append((column_titles[n_cols], column.get_text().replace('\n', ' ').strip()))
                n_cols += 1 # advance columns
            sections[table_headers[n_tables]].append(entry)
        n_tables += 1 # advance tables

    return BulletinEntryDetailed(bulletin_entry, sections)

def main() -> None:
    # parser = argparse.ArgumentParser()
    sess = requests.Session()
    html_page = sess.get(url=URL)
    html_parser = BeautifulSoup(html_page.content, 'html.parser')
    
    # entries from main page
    bulletin_table_entries = extract_bulletins(html_parser)

    # sections for each entry
    for bulletin_table_entry in bulletin_table_entries[:2]:
        sections = extract_bulletin_sections(bulletin_table_entry)
        print(sections)
        print("-*-" * 30)
        with open('android_bulletins.json', 'w', encoding='utf-8') as f:
            json.dump(sections, f, ensure_ascii=False, indent=4)

if __name__ == '__main__':
    main()
