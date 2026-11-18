-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/TripWary.C!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_UNKNOWN_FILE & Lua:FileInsideAppDataLocalFolder & Lua:UnknownFileExtension

local l_0_0, l_0_1 = pcall(mp.getfilename, mp.FILEPATH_QUERY_FULL)
if l_0_0 then
  local l_0_2 = "AppData\\Local"
  local l_0_3 = l_0_1:find(l_0_2, 1, true)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_4 = string.sub(l_0_1, l_0_3 + #l_0_2)
  local l_0_5, l_0_6 = l_0_4:gsub("\\", "")
  if l_0_6 < 4 and 6 < l_0_6 then
    return mp.CLEAN
  end
  local l_0_7, l_0_8 = MpCommon.StringRegExpSearch("([a-zA-Z0-9]{10,20}\\\\[a-zA-Z0-9]{10,20}\\\\[a-zA-Z0-9]{10,20}.[a-z]{3}$)", l_0_4)
  if l_0_7 == false then
    return mp.CLEAN
  end
  local l_0_9 = string.sub(l_0_4, 0, #l_0_4 - #l_0_8)
  local l_0_10 = {
    ["\\Microsoft\\Windows\\PowerShell\\"] = true,
    ["\\Microsoft\\Office\\PowerPoint\\"] = true,
    ["\\Microsoft\\Internet Explorer\\"] = true,
    ["\\Microsoft\\Office\\Publisher\\"] = true,
    ["\\Microsoft\\Windows\\Explorer\\"] = true,
    ["\\Microsoft\\Office\\Outlook\\"] = true,
    ["\\Microsoft\\Windows\\Shell\\"] = true,
    ["\\Microsoft\\Office\\Access\\"] = true,
    ["\\Microsoft\\Office\\Visio\\"] = true,
    ["\\Microsoft\\Office\\Excel\\"] = true,
    ["\\Microsoft\\Media Player\\"] = true,
    ["\\Microsoft\\Office\\Word\\"] = true,
    ["\\Microsoft\\VisualStudio\\"] = true,
    ["\\Microsoft\\CLR_v2.0_32\\"] = true,
    ["\\Microsoft\\CLR_v4.0_32\\"] = true,
    ["\\Microsoft\\Powerpoint\\"] = true,
    ["\\Microsoft\\Installer\\"] = true,
    ["\\Microsoft\\CLR_v2.0\\"] = true,
    ["\\Microsoft\\CLR_v4.0\\"] = true,
    ["\\Microsoft\\OneDrive\\"] = true,
    ["\\Microsoft\\Network\\"] = true,
    ["\\Microsoft\\Outlook\\"] = true,
    ["\\Microsoft\\MSBuild\\"] = true,
    ["\\Microsoft\\Office\\"] = true,
    ["\\Microsoft\\DotNet\\"] = true,
    ["\\Microsoft\\Access\\"] = true,
    ["\\Microsoft\\AddIns\\"] = true,
    ["\\Microsoft\\Crypto\\"] = true,
    ["\\Microsoft\\Vault\\"] = true,
    ["\\Microsoft\\Excel\\"] = true,
    ["\\Mozilla\\Firefox\\"] = true,
    ["\\Microsoft\\Word\\"] = true,
    ["\\Microsoft\\"] = true,
    ["\\Adobe\\"] = true
  }
  if l_0_10[l_0_9] then
    return mp.INFECTED
  end
end
return mp.CLEAN
