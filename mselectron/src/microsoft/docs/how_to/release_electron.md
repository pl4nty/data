# How To: make an Electron release internally

First, run [\Electron\prod\electron-release-trigger][] from the appropriate branch,
it will trigger other runs (check the log).  

Once the triggered runs are complete:

-   Create a release from [\Electron\teams-client-electron-snapshot][].
For ProjectSnapshot, select the triggered "electron-util-project-snapshot" run.

-   Create a release page on our Wiki [here](https://microsoft.sharepoint.com/teams/ElectronInMicrosoft/Wiki/Home.aspx)
using the wiki page published as a pipeline artifact.

After all release parts are published, announce a new release in the "[Electron At Microsoft > Announcements][]"
channel. Posts there are usually pretty brief and usually only have a link to a new wiki page,
and a link to GitHub release notes for the release.

[\Electron\prod\electron-release-trigger]: https://devdiv.visualstudio.com/DevDiv/_build?definitionId=19819
[\Electron\electron-snapshot]: https://devdiv.visualstudio.com/DevDiv/_release?_a=releases&view=all&definitionId=3411
[Electron At Microsoft > Announcements]: https://teams.microsoft.com/l/channel/19%3ac5aca84b5d29433687c4d0b167a07c36%40thread.skype/Announcements?groupId=4cbf23e6-55a0-4312-a1ee-f175b971858e&tenantId=72f988bf-86f1-41af-91ab-2d7cd011db47
