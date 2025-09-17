-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!BaseFileEncryptC\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if l_0_0 == mp.SCANREASON_ONOPEN and (mp.get_contextdata)(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.CLEAN
end
local l_0_1 = (versioning.GetOrgID)()
if l_0_1 == nil or type(l_0_1) ~= "string" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if l_0_1 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_1 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and (l_0_1 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" or (MpCommon.IsSampled)(10, false, true, true) ~= true) then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
if l_0_2 ~= "sbsimulator.exe" and (string.find)(l_0_2, "sbsimulator", 1, true) == nil and (string.find)(l_0_2, "sbsimulation", 1, true) == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
l_0_4 = (string.lower)(l_0_4)
local l_0_5 = (string.match)(l_0_4, "(%.[^%.]+)$")
if IsBasFileEncryptExt(l_0_5) == false then
  if (string.find)(l_0_4, "sb_%d+_bs_%d+%.[^%.]+$") == nil then
    return mp.CLEAN
  end
  local l_0_6 = (MpCommon.PathToWin32Path)(l_0_3)
  if l_0_6 ~= nil and l_0_6 ~= "" then
    l_0_6 = (string.lower)(l_0_6)
  end
  local l_0_7 = (MpCommon.ExpandEnvironmentVariables)(l_0_3)
  l_0_7 = (MpCommon.PathToWin32Path)(l_0_7)
  if l_0_7 ~= nil and l_0_7 ~= "" then
    l_0_7 = (string.lower)(l_0_7)
  end
  local l_0_8 = (mp.ContextualExpandEnvironmentVariables)(l_0_3)
  l_0_8 = (MpCommon.PathToWin32Path)(l_0_8)
  if l_0_8 ~= nil and l_0_8 ~= "" then
    l_0_8 = (string.lower)(l_0_8)
  end
  local l_0_9 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%systemroot%"))
  local l_0_10 = (string.lower)((mp.ContextualExpandEnvironmentVariables)("%temp%"))
  if (string.find)(l_0_3, "[a-z]:\\windows\\temp\\sb%-sim%-temp") == nil and (string.find)(l_0_3, l_0_9 .. "\\temp\\sb%-sim%-temp") == nil and (string.find)(l_0_3, "[a-z]:\\users\\[^\\]+\\appdata\\local\\temp\\sb_%d+_bs_") == nil and (string.find)(l_0_3, l_0_10 .. "\\sb_%d+_bs_") == nil and l_0_6 ~= nil and (string.find)(l_0_6, "[a-z]:\\windows\\temp\\sb%-sim%-temp") == nil and l_0_6 ~= nil and (string.find)(l_0_6, l_0_9 .. "\\temp\\sb%-sim%-temp") == nil and l_0_6 ~= nil and (string.find)(l_0_6, "[a-z]:\\users\\[^\\]+\\appdata\\local\\temp\\sb_%d+_bs_") == nil and l_0_6 ~= nil and (string.find)(l_0_6, l_0_10 .. "\\sb_%d+_bs_") == nil and l_0_7 ~= nil and (string.find)(l_0_7, "[a-z]:\\windows\\temp\\sb%-sim%-temp") == nil and l_0_7 ~= nil and (string.find)(l_0_7, l_0_9 .. "\\temp\\sb%-sim%-temp") == nil and l_0_7 ~= nil and (string.find)(l_0_7, "[a-z]:\\users\\[^\\]+\\appdata\\local\\temp\\sb_%d+_bs_") == nil and l_0_7 ~= nil and (string.find)(l_0_7, l_0_10 .. "\\sb_%d+_bs_") == nil and l_0_8 ~= nil and (string.find)(l_0_8, "[a-z]:\\windows\\temp\\sb%-sim%-temp") == nil and l_0_8 ~= nil and (string.find)(l_0_8, l_0_9 .. "\\temp\\sb%-sim%-temp") == nil and l_0_8 ~= nil and (string.find)(l_0_8, "[a-z]:\\users\\[^\\]+\\appdata\\local\\temp\\sb_%d+_bs_") == nil and l_0_8 ~= nil and (string.find)(l_0_8, l_0_10 .. "\\sb_%d+_bs_") == nil then
    (mp.set_mpattribute)("MpDisableMOACSyncInsert")
    ;
    (mp.set_mpattribute)("MpDisableCaching")
    return mp.CLEAN
  end
end
do
  ;
  (MpCommon.BmTriggerSigPropagate)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "BAS_BaseFileEncryptProc", l_0_3)
  return mp.INFECTED
end

