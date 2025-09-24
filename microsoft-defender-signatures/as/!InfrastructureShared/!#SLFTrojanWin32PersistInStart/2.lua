-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32PersistInStart\2.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if (mp.get_mpattribute)("BM_MZ_FILE") and l_0_0 == mp.SCANREASON_ONOPEN and (mp.get_contextdata)(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.CLEAN
end
local l_0_1 = (versioning.GetOrgID)()
if l_0_1 == nil or type(l_0_1) ~= "string" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if l_0_1 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_1 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
if l_0_2 ~= "python.exe" then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = (mp.GetProcessCommandLine)(l_0_3)
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
l_0_4 = (string.lower)(l_0_4)
if (string.find)(l_0_4, "\\attackiq\\", 1, true) == nil and (string.find)(l_0_4, "\\ai_cleanup", 1, true) == nil and (string.find)(l_0_4, "\\attack_graph", 1, true) == nil then
  return mp.CLEAN
end
local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
l_0_5 = (string.lower)(l_0_5)
local l_0_6 = (string.match)(l_0_5, "(%.[^%.]+)$")
if l_0_6 ~= ".exe" then
  return mp.CLEAN
end
local l_0_7 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_7 == nil or l_0_7 == "" then
  return mp.CLEAN
end
l_0_7 = (string.lower)(l_0_7)
if (string.find)(l_0_7, "\\attackiq", 1, true) == nil then
  return mp.CLEAN
end
local l_0_8 = (MpCommon.PathToWin32Path)(l_0_7)
if l_0_8 ~= nil and l_0_8 ~= "" then
  l_0_8 = (string.lower)(l_0_8)
end
local l_0_9 = (MpCommon.ExpandEnvironmentVariables)(l_0_7)
if l_0_9 ~= nil and l_0_9 ~= "" then
  l_0_9 = (MpCommon.PathToWin32Path)(l_0_9)
end
if l_0_9 ~= nil and l_0_9 ~= "" then
  l_0_9 = (string.lower)(l_0_9)
end
local l_0_10 = (mp.ContextualExpandEnvironmentVariables)(l_0_7)
if l_0_10 ~= nil and l_0_10 ~= "" then
  l_0_10 = (MpCommon.PathToWin32Path)(l_0_10)
end
if l_0_10 ~= nil and l_0_10 ~= "" then
  l_0_10 = (string.lower)(l_0_10)
end
local l_0_11 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%systemroot%"))
local l_0_12 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%programdata%"))
if (string.find)(l_0_7, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and (string.find)(l_0_7, l_0_11 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and (string.find)(l_0_7, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and (string.find)(l_0_7, l_0_12 .. "\\start menu\\programs\\startup") == nil and (string.find)(l_0_7, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and (string.find)(l_0_7, l_0_12 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, l_0_11 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, l_0_12 .. "\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_8 ~= nil and (string.find)(l_0_8, l_0_12 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, l_0_11 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, l_0_12 .. "\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_9 ~= nil and (string.find)(l_0_9, l_0_12 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_10 ~= nil and (string.find)(l_0_10, "[a-z]:\\windows\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_10 ~= nil and (string.find)(l_0_10, l_0_11 .. "\\system32\\config\\systemprofile\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_10 ~= nil and (string.find)(l_0_10, "[a-z]:\\programdata\\start menu\\programs\\startup") == nil and l_0_10 ~= nil and (string.find)(l_0_10, l_0_12 .. "\\start menu\\programs\\startup") == nil and l_0_10 ~= nil and (string.find)(l_0_10, "[a-z]:\\programdata\\microsoft\\windows\\start menu\\programs\\startup") == nil and l_0_10 ~= nil and (string.find)(l_0_10, l_0_12 .. "\\microsoft\\windows\\start menu\\programs\\startup") == nil then
  return mp.CLEAN
end
;
(MpCommon.BmTriggerSig)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "BAS_PersistInStartupDir", l_0_7)
return mp.INFECTED

