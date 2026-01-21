-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!PersistInStartupDirB\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_0 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_0 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and l_0_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" and (MpCommon.IsSampled)(100, false, false, false) ~= true then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if l_0_1 ~= "python.exe" then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if (string.find)(l_0_3, "\\attackiq\\", 1, true) == nil and (string.find)(l_0_3, "\\ai_cleanup", 1, true) == nil and (string.find)(l_0_3, "\\attack_graph", 1, true) == nil then
  return mp.CLEAN
end
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
l_0_4 = (string.lower)(l_0_4)
local l_0_5 = (string.match)(l_0_4, "(%.[^%.]+)$")
if l_0_5 ~= ".exe" then
  return mp.CLEAN
end
local l_0_6 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
l_0_6 = (string.lower)(l_0_6)
if (string.find)(l_0_6, "\\attackiq", 1, true) == nil then
  return mp.CLEAN
end
local l_0_7 = (MpCommon.PathToWin32Path)(l_0_6)
if l_0_7 ~= nil and l_0_7 ~= "" then
  l_0_7 = (string.lower)(l_0_7)
end
local l_0_8 = (MpCommon.ExpandEnvironmentVariables)(l_0_6)
if l_0_8 ~= nil and l_0_8 ~= "" then
  l_0_8 = (MpCommon.PathToWin32Path)(l_0_8)
end
if l_0_8 ~= nil and l_0_8 ~= "" then
  l_0_8 = (string.lower)(l_0_8)
end
local l_0_9 = (mp.ContextualExpandEnvironmentVariables)(l_0_6)
if l_0_9 ~= nil and l_0_9 ~= "" then
  l_0_9 = (MpCommon.PathToWin32Path)(l_0_9)
end
if l_0_9 ~= nil and l_0_9 ~= "" then
  l_0_9 = (string.lower)(l_0_9)
end
local l_0_10 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%systemroot%"))
local l_0_11 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%programdata%"))
if (string.find)(l_0_6, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and (string.find)(l_0_6, l_0_10 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and (string.find)(l_0_6, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and (string.find)(l_0_6, l_0_11 .. "\\start menu\\programs\\startup") == nil and (string.find)(l_0_6, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and (string.find)(l_0_6, l_0_11 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, l_0_10 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, l_0_11 .. "\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, l_0_11 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, l_0_10 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, l_0_11 .. "\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, l_0_11 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, l_0_10 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, l_0_11 .. "\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, l_0_11 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil then
  return mp.CLEAN
end
;
(MpCommon.BmTriggerSig)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "BAS_PersistInStartupDir", l_0_6)
return mp.INFECTED

