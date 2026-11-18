-- Threat: !InfrastructureShared
-- Name: !#BLKACC:3b576869-a4ec-4529-8536-b80a7769e899
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_SCRIPT_OR_TEXT_FILE

if not mp.IsHipsRuleEnabled("3b576869-a4ec-4529-8536-b80a7769e899") then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = false
local l_0_1 = {
  [".bat"] = true,
  [".cmd"] = true,
  [".hta"] = true,
  [".jar"] = true,
  [".js"] = true,
  [".jse"] = true,
  [".lnk"] = true,
  [".pif"] = true,
  [".ps1"] = true,
  [".psc1"] = true,
  [".settingcontent-ms"] = true,
  [".appcontent-ms"] = true,
  [".application"] = true,
  [".scr"] = true,
  [".sys"] = true,
  [".vbe"] = true,
  [".vbs"] = true,
  [".wsc"] = true,
  [".wsf"] = true,
  [".wsh"] = true,
  [".ocx"] = true,
  [".com"] = true,
  [".exe"] = true,
  [".dll"] = true,
  [".xll"] = true
}
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
local l_0_3 = string.match(l_0_2, "(%.[^%.]+)$")
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if l_0_1[l_0_3] == true then
  l_0_0 = true
else
  local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if not l_0_4 or l_0_4 == "" then
    return mp.CLEAN
  end
  local l_0_5 = string.lower(l_0_4)
  local l_0_6 = {
    ["cmd.exe"] = true,
    ["powershell.exe"] = true
  }
  local l_0_7 = {
    ["cscript.exe"] = true,
    ["wscript.exe"] = true
  }
  local l_0_8 = {
    ["mshta.exe"] = true,
    ["rundll32.exe"] = true,
    ["regasm.exe"] = true,
    ["regsvc.exe"] = true,
    ["regsvr32.exe"] = true,
    ["msbuild.exe"] = true,
    ["certutil.exe"] = true,
    ["installutil.exe"] = true
  }
  if l_0_6[l_0_5] == true or l_0_7[l_0_5] == true or l_0_8[l_0_5] == true then
    l_0_0 = true
  end
end
if l_0_0 == false then
  return mp.CLEAN
end
local l_0_9 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_9 == nil or l_0_9 == "" then
  return mp.CLEAN
end
l_0_9 = MpCommon.PathToWin32Path(l_0_9)
if l_0_9 == nil or l_0_9 == "" then
  return mp.CLEAN
end
l_0_9 = string.lower(l_0_9)
if MpCommon.QueryPersistContext(l_0_9, "DroppedByOfficeProc") then
  mp.ReportLowfi(mp.getfilename(), 3347840832)
end
return mp.CLEAN
