-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanWin32EncryptTargetE\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "attackiq_staged_data", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = (string.match)(l_0_0, "(%.[^%.\\]+)$")
local l_0_2 = {}
l_0_2[".doc"] = true
l_0_2[".docx"] = true
l_0_2[".xls"] = true
l_0_2[".xlsx"] = true
l_0_2[".pdf"] = true
if l_0_1 == nil or l_0_2[l_0_1] ~= true then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_3 == nil or (string.lower)(l_0_3) ~= "cmd.exe" then
  return mp.CLEAN
end
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
local l_0_5 = (mp.GetProcessCommandLine)(l_0_4)
if l_0_5 == nil or (string.find)((string.lower)(l_0_5), "aiq-", 1, true) == nil then
  return mp.CLEAN
end
local l_0_6 = (mp.GetParentProcInfo)(l_0_4)
if l_0_6 == nil or l_0_6.ppid == nil or l_0_6.image_path == nil then
  return mp.CLEAN
end
local l_0_7 = (string.match)((string.lower)(l_0_6.image_path), "([^\\]+)$")
if l_0_7 ~= "python.exe" then
  return mp.CLEAN
end
local l_0_8 = (mp.GetProcessCommandLine)(l_0_6.ppid)
if l_0_8 == nil or (string.find)((string.lower)(l_0_8), "attackiq", 1, true) == nil then
  return mp.CLEAN
end
;
(MpCommon.BmTriggerSig)(l_0_4, "BAS_EncryptTargetE", l_0_0)
return mp.INFECTED

