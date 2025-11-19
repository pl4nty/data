-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!PersistInStartupDirA\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_0 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_0 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and (l_0_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" or (MpCommon.IsSampled)(1000, false, true, true) ~= true) then
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
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = (string.match)(l_0_2, "(%.[^%.]+)$")
if l_0_3 ~= ".exe" then
  return mp.CLEAN
end
local l_0_4 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
l_0_4 = (string.lower)(l_0_4)
local l_0_5 = (MpCommon.PathToWin32Path)(l_0_4)
if l_0_5 ~= nil and l_0_5 ~= "" then
  l_0_5 = (string.lower)(l_0_5)
end
local l_0_6 = (MpCommon.ExpandEnvironmentVariables)(l_0_4)
if l_0_6 ~= nil and l_0_6 ~= "" then
  l_0_6 = (MpCommon.PathToWin32Path)(l_0_6)
end
if l_0_6 ~= nil and l_0_6 ~= "" then
  l_0_6 = (string.lower)(l_0_6)
end
local l_0_7 = (mp.ContextualExpandEnvironmentVariables)(l_0_4)
if l_0_7 ~= nil and l_0_7 ~= "" then
  l_0_7 = (MpCommon.PathToWin32Path)(l_0_7)
end
if l_0_7 ~= nil and l_0_7 ~= "" then
  l_0_7 = (string.lower)(l_0_7)
end
local l_0_8 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%systemroot%"))
local l_0_9 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%programdata%"))
if (string.find)(l_0_4, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and (string.find)(l_0_4, l_0_8 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and (string.find)(l_0_4, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and (string.find)(l_0_4, l_0_9 .. "\\start menu\\programs\\startup") == nil and (string.find)(l_0_4, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and (string.find)(l_0_4, l_0_9 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_5 ~= nil and (string.find)(l_0_5, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_5 ~= nil and (string.find)(l_0_5, l_0_8 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_5 ~= nil and (string.find)(l_0_5, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and l_0_5 ~= nil and (string.find)(l_0_5, l_0_9 .. "\\start menu\\programs\\startup") == nil and l_0_5 ~= nil and (string.find)(l_0_5, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_5 ~= nil and (string.find)(l_0_5, l_0_9 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_6 ~= nil and (string.find)(l_0_6, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_6 ~= nil and (string.find)(l_0_6, l_0_8 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_6 ~= nil and (string.find)(l_0_6, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and l_0_6 ~= nil and (string.find)(l_0_6, l_0_9 .. "\\start menu\\programs\\startup") == nil and l_0_6 ~= nil and (string.find)(l_0_6, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_6 ~= nil and (string.find)(l_0_6, l_0_9 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, l_0_8 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, l_0_9 .. "\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_7 ~= nil and (string.find)(l_0_7, l_0_9 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil then
  return mp.CLEAN
end
;
(MpCommon.BmTriggerSig)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "BAS_PersistInStartupDirTel", l_0_4)
return mp.INFECTED

