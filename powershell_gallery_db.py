import sqlite3
import requests
import xmltodict
import logging
from typing import Optional, Any, Dict
from pathlib import Path


class GalleryImporter:
    def __init__(self, db_path: str):
        self.db_path = db_path
        logging.basicConfig(level=logging.INFO)
        self.logger = logging.getLogger(__name__)
        self.setup_database()

    def setup_database(self):
        with sqlite3.connect(self.db_path) as conn:
            conn.executescript('''
                CREATE TABLE IF NOT EXISTS Packages (
                    Id TEXT,
                    Version TEXT,
                    Authors TEXT,
                    Description TEXT,
                    DownloadCount INTEGER,
                    Published TEXT,
                    PackageSize INTEGER,
                    Tags TEXT,
                    PRIMARY KEY (Id, Version)
                );

                CREATE TABLE IF NOT EXISTS PackageFiles (
                    PackageId TEXT,
                    PackageVersion TEXT,
                    FilePath TEXT,
                    FOREIGN KEY (PackageId, PackageVersion) REFERENCES Packages(Id, Version)
                );
            ''')

    def get_text_value(self, data: Any) -> str:
        """Safely extract text value from XML dictionary structure."""
        if data is None:
            return ''
        if isinstance(data, str):
            return data
        if isinstance(data, dict):
            return str(data.get('#text', ''))
        return str(data)

    def import_packages(self, url: str = "https://www.powershellgallery.com/api/v2/Packages?$filter=IsLatestVersion"):
        while url:
            try:
                response = requests.get(url)
                response.raise_for_status()

                data = xmltodict.parse(response.text)
                feed = data['feed']

                if 'entry' not in feed:
                    break

                entries = feed['entry']
                if not isinstance(entries, list):
                    entries = [entries]

                with sqlite3.connect(self.db_path) as conn:
                    for entry in entries:
                        try:
                            props = entry['m:properties']

                            # Insert package data
                            package_data = {
                                'id': self.get_text_value(props['d:Id']),
                                'version': self.get_text_value(props['d:Version']),
                                'authors': self.get_text_value(props['d:Authors']),
                                'description': self.get_text_value(props['d:Description']),
                                'download_count': int(self.get_text_value(props['d:DownloadCount']) or 0),
                                'published': self.get_text_value(props['d:Published']),
                                'package_size': int(self.get_text_value(props['d:PackageSize']) or 0),
                                'tags': self.get_text_value(props['d:Tags'])
                            }

                            conn.execute('''
                                INSERT OR REPLACE INTO Packages 
                                (Id, Version, Authors, Description, DownloadCount, Published, PackageSize, Tags)
                                VALUES (:id, :version, :authors, :description, :download_count, :published, :package_size, :tags)
                            ''', package_data)

                            # Insert file listings
                            if props.get('d:FileList'):
                                files = self.get_text_value(
                                    props['d:FileList']).split('|')
                                conn.executemany('''
                                    INSERT INTO PackageFiles (PackageId, PackageVersion, FilePath)
                                    VALUES (?, ?, ?)
                                ''', [(package_data['id'], package_data['version'], file) for file in files if file])

                        except Exception as e:
                            self.logger.error(f"Error processing entry: {e}")
                            continue

                # Get next page URL
                next_link = next((link['@href'] for link in feed.get('link', [])
                                  if isinstance(link, dict) and link.get('@rel') == 'next'), None)
                url = next_link

            except Exception as e:
                self.logger.error(f"Error fetching data: {e}")
                break


def main():
    db_path = Path(__file__).parent / "powershell_gallery.db"
    importer = GalleryImporter(str(db_path))
    importer.import_packages()


if __name__ == "__main__":
    main()
