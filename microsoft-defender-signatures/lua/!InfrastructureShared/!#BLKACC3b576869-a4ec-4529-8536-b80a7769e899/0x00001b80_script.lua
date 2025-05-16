-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#BLKACC3b576869-a4ec-4529-8536-b80a7769e899\0x00001b80_luac 

-- params : ...
-- function num : 0
if not (mp.IsHipsRuleEnabled)("3b576869-a4ec-4529-8536-b80a7769e899") then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = false
local l_0_1 = {}
l_0_1[".bat"] = true
l_0_1[".cmd"] = true
l_0_1[".hta"] = true
l_0_1[".jar"] = true
l_0_1[".js"] = true
l_0_1[".jse"] = true
l_0_1[".lnk"] = true
l_0_1[".pif"] = true
l_0_1[".ps1"] = true
l_0_1[".psc1"] = true
l_0_1[".settingcontent-ms"] = true
l_0_1[".appcontent-ms"] = true
l_0_1[".application"] = true
l_0_1[".scr"] = true
l_0_1[".sys"] = true
l_0_1[".vbe"] = true
l_0_1[".vbs"] = true
l_0_1[".wsc"] = true
l_0_1[".wsf"] = true
l_0_1[".wsh"] = true
l_0_1[".ocx"] = true
l_0_1[".com"] = true
l_0_1[".exe"] = true
l_0_1[".dll"] = true
l_0_1[".xll"] = true
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = (string.match)(l_0_2, "(%.[^%.]+)$")
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if l_0_1[l_0_3] == true then
  l_0_0 = true
else
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if not l_0_4 or l_0_4 == "" then
    return mp.CLEAN
  end
  local l_0_5 = (string.lower)(l_0_4)
  local l_0_6 = {}
  l_0_6["cmd.exe"] = true
  l_0_6["powershell.exe"] = true
  local l_0_7 = {}
  l_0_7["cscript.exe"] = true
  l_0_7["wscript.exe"] = true
  local l_0_8 = {}
  l_0_8["mshta.exe"] = true
  l_0_8["rundll32.exe"] = true
  l_0_8["regasm.exe"] = true
  l_0_8["regsvc.exe"] = true
  l_0_8["regsvr32.exe"] = true
  l_0_8["msbuild.exe"] = true
  l_0_8["certutil.exe"] = true
  l_0_8["installutil.exe"] = true
  if l_0_6[l_0_5] == true or l_0_7[l_0_5] == true or l_0_8[l_0_5] == true then
    l_0_0 = true
  end
end
do
  if l_0_0 == false then
    return mp.CLEAN
  end
  local l_0_9 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
  if l_0_9 == nil or l_0_9 == "" then
    return mp.CLEAN
  end
  l_0_9 = (MpCommon.PathToWin32Path)(l_0_9)
  if l_0_9 == nil or l_0_9 == "" then
    return mp.CLEAN
  end
  l_0_9 = (string.lower)(l_0_9)
  if (MpCommon.QueryPersistContext)(l_0_9, "DroppedByOfficeProc") then
    (mp.ReportLowfi)((mp.getfilename)(), 3347840832)
  end
  return mp.CLEAN
end

