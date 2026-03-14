-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!EncryptTargetA\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (l_0_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" and l_0_0 ~= "392708a8-b7f0-49e3-bc8f-ca134f1f60d7") or (MpCommon.IsSampled)(10, false, false, false) ~= true then
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
if l_0_3 ~= ".x2anylock" then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("MpDisableMOACSyncInsert")
;
(mp.set_mpattribute)("MpDisableCaching")
local l_0_4 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
l_0_4 = (string.lower)(l_0_4)
;
(MpCommon.BmTriggerSig)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "BAS_EncryptTargetB", l_0_4)
return mp.INFECTED

