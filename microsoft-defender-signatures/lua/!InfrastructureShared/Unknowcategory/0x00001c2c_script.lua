-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001c2c_luac 

-- params : ...
-- function num : 0
GetRuleInfo = function()
  -- function num : 0_0
  local l_1_0 = {}
  l_1_0.Name = "Block Office applications from injecting code into other processes"
  l_1_0.Description = "Windows Defender Exploit Guard detected Office application injecting code into the process."
  l_1_0.NotificationDedupingInterval = 14400
  l_1_0.NotificationDedupingScope = HIPS.DEDUPE_SCOPE_ALL
  l_1_0.Type = (HIPS.bitor)(HIPS.RULE_DISABLE_AUDIT_INHERITANCE, HIPS.RULE_DISABLE_BLOCK_INHERITANCE)
  l_1_0.Flags = HIPS.NO_INVOLVEDDOC_EXCL
  return l_1_0
end

GetMonitoredLocations = function()
  -- function num : 0_1
  local l_2_0 = {}
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office16\\WINWORD.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office16\\EXCEL.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office16\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office16\\ONENOTE.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office15\\WINWORD.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office15\\EXCEL.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office15\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office15\\ONENOTE.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office14\\WINWORD.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office14\\EXCEL.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office14\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\root\\Office14\\ONENOTE.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office16\\WINWORD.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office16\\EXCEL.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office16\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office16\\ONENOTE.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office15\\WINWORD.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office15\\EXCEL.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office15\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office15\\ONENOTE.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office14\\WINWORD.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office14\\EXCEL.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office14\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles(x86)%\\Microsoft Office\\Office14\\ONENOTE.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office16\\WINWORD.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office16\\EXCEL.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office16\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office16\\ONENOTE.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office15\\WINWORD.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office15\\EXCEL.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office15\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office15\\ONENOTE.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office14\\WINWORD.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office14\\EXCEL.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office14\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\root\\Office14\\ONENOTE.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office16\\WINWORD.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office16\\EXCEL.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office16\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office16\\ONENOTE.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office15\\WINWORD.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office15\\EXCEL.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office15\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office15\\ONENOTE.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office14\\WINWORD.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office14\\EXCEL.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office14\\POWERPNT.EXE"] = 2
  l_2_0["%programfiles%\\Microsoft Office\\Office14\\ONENOTE.EXE"] = 2
  return 2, l_2_0
end

GetPathExclusions = function()
  -- function num : 0_2
  local l_3_0 = {}
  l_3_0["%windir%\\system32\\WerFault.exe"] = 2
  l_3_0["%windir%\\SysWOW64\\WerFault.exe"] = 2
  l_3_0["%windir%\\system32\\DWWIN.EXE"] = 2
  l_3_0["%windir%\\SysWOW64\\DWWIN.EXE"] = 2
  l_3_0["C:\\Windows\\system32\\DWWIN.EXE"] = 0
  l_3_0["C:\\Windows\\SysWOW64\\DWWIN.EXE"] = 0
  l_3_0["%windir%\\system32\\spool\\drivers\\x64\\3\\CPC10Q.EXE"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft Azure Information Protection\\MSIP.ExecutionHost.exe"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft Azure Information Protection\\MSIP.ExecutionHost32.exe"] = 2
  l_3_0["%programfiles%\\Microsoft Azure Information Protection\\MSIP.ExecutionHost.exe"] = 2
  l_3_0["%programfiles%\\Microsoft Azure Information Protection\\MSIP.ExecutionHost32.exe"] = 2
  l_3_0["%programfiles%\\Common Files\\microsoft shared\\ClickToRun\\OfficeClickToRun.exe"] = 2
  l_3_0["%programfiles%\\Microsoft OneDrive\\*\\FileCoAuth.exe"] = 2
  l_3_0["%programfiles%\\WindowsApps\\MSTeams_*\\ms-teams.exe"] = 2
  l_3_0["%programdata%\\App-V"] = 2
  l_3_0["%programfiles%\\Microsoft Office\\root\\VFS\\ProgramFilesCommonX64\\Microsoft Shared\\DW\\dw20.exe"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft Office\\root\\VFS\\ProgramFilesCommonX64\\Microsoft Shared\\DW\\dw20.exe"] = 2
  l_3_0["%programfiles(x86)%\\Common Files\\microsoft shared\\DW\\DW20.EXE"] = 2
  l_3_0["%programfiles%\\Common Files\\microsoft shared\\DW\\DW20.EXE"] = 2
  l_3_0["%programfiles%\\Microsoft Office\\root\\Office16\\ADDINS\\Microsoft Power Query for Excel Integrated\\bin\\Microsoft.Mashup.Container.Loader.exe"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft Office\\root\\Office16\\ADDINS\\Microsoft Power Query for Excel Integrated\\bin\\Microsoft.Mashup.Container.Loader.exe"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft\\EdgeWebView\\Application\\*\\msedgewebview2.exe"] = 2
  l_3_0["%programfiles%\\Microsoft\\EdgeWebView\\Application\\*\\msedgewebview2.exe"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft\\Edge Beta\\Application\\*\\msedgewebview2.exe"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft\\Edge\\Application\\msedge.exe"] = 2
  l_3_0["%programfiles%\\Microsoft\\Edge\\Application\\msedge.exe"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft Office\\root\\Office16\\ONENOTEM.EXE"] = 2
  l_3_0["%programfiles%\\Microsoft Office\\root\\Office16\\ONENOTEM.EXE"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft Office\\root\\Office16\\ONENOTE.EXE"] = 2
  l_3_0["%programfiles%\\Microsoft Office\\root\\Office16\\ONENOTE.EXE"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft Office\\Office*\\FIRSTRUN.EXE"] = 2
  l_3_0["%programfiles%\\Microsoft Office\\Office*\\FIRSTRUN.EXE"] = 2
  l_3_0["%programfiles%\\Google\\Chrome\\Application\\chrome.exe"] = 2
  l_3_0["%programfiles%\\WindowsApps\\Microsoft.Office.Desktop_*\\VFS\\ProgramFilesCommonX??\\Microsoft Shared\\OFFICE16\\ai.exe"] = 2
  l_3_0["%programfiles%\\WindowsApps\\Microsoft.Office.Desktop_*\\vfs\\ProgramFilesCommonX??\\Microsoft Shared\\OFFICE16\\AI\\ai.exe"] = 2
  l_3_0["%programfiles%\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX??\\Microsoft Shared\\Office16\\ai.exe"] = 2
  l_3_0["%programfiles%\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX??\\Microsoft Shared\\Office16\\AI\\ai.exe"] = 2
  l_3_0["%programfiles%\\WindowsApps\\Microsoft.Office.Desktop_*\\VFS\\ProgramFilesCommonX??\\Microsoft Shared\\OFFICE16\\aimgr.exe"] = 2
  l_3_0["%programfiles%\\WindowsApps\\Microsoft.Office.Desktop_*\\vfs\\ProgramFilesCommonX??\\Microsoft Shared\\OFFICE16\\AI\\aimgr.exe"] = 2
  l_3_0["%programfiles%\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX??\\Microsoft Shared\\Office16\\aimgr.exe"] = 2
  l_3_0["%programfiles%\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX??\\Microsoft Shared\\Office16\\AI\\aimgr.exe"] = 2
  l_3_0["%programfiles(x86)%\\WindowsApps\\Microsoft.Office.Desktop_*\\VFS\\ProgramFilesCommonX??\\Microsoft Shared\\OFFICE16\\ai.exe"] = 2
  l_3_0["%programfiles(x86)%\\WindowsApps\\Microsoft.Office.Desktop_*\\VFS\\ProgramFilesCommonX??\\Microsoft Shared\\OFFICE16\\AI\\ai.exe"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX??\\Microsoft Shared\\Office16\\ai.exe"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX??\\Microsoft Shared\\Office16\\AI\\ai.exe"] = 2
  l_3_0["%programfiles(x86)%\\WindowsApps\\Microsoft.Office.Desktop_*\\VFS\\ProgramFilesCommonX??\\Microsoft Shared\\OFFICE16\\aimgr.exe"] = 2
  l_3_0["%programfiles(x86)%\\WindowsApps\\Microsoft.Office.Desktop_*\\VFS\\ProgramFilesCommonX??\\Microsoft Shared\\OFFICE16\\AI\\aimgr.exe"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX??\\Microsoft Shared\\Office16\\aimgr.exe"] = 2
  l_3_0["%programfiles(x86)%\\Microsoft Office\\root\\vfs\\ProgramFilesCommonX??\\Microsoft Shared\\Office16\\AI\\aimgr.exe"] = 2
  l_3_0["%programfiles(x86)%\\Adobe\\Acrobat Reader DC\\Reader\\AcroRd??.exe"] = 2
  l_3_0["%programfiles(x86)%\\Office Timeline\\Current\\Ines.UserService.Exe"] = 2
  l_3_0["%programfiles(x86)%\\empower\\charts\\LiveUpdateHub.exe"] = 2
  l_3_0["%programfiles(x86)%\\Dania Software\\DynamicTemplate for Office\\ApplicationFocus.exe"] = 2
  l_3_0["%windir%\\splwow64.exe"] = 2
  l_3_0["%windir%\\system32\\fsiso.exe"] = 2
  return l_3_0
end

GetCommandLineRegExp = function()
  -- function num : 0_3
  return "((windowsapps\\\\[^\\\\]+\\\\)|(microsoft office\\\\(root\\\\)?))office..\\\\(winword|excel|powerpnt|onenote)\\.exe\\\"?[^\\\"]+\\\"([^\\\"]+)\\\"?"
end


