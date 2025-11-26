-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!MalInjectA\Unknowcategory\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "injectable_dll_[^%.]+%.dll") == nil then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("MpDisableMOACSyncInsert")
;
(mp.set_mpattribute)("MpDisableCaching")
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
if (string.find)(l_0_2, "sleeping_binary_[^%.]+%.exe") == nil then
  return mp.CLEAN
end
local l_0_3 = (versioning.GetOrgID)()
if l_0_3 == nil or type(l_0_3) ~= "string" then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if l_0_3 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_3 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and (l_0_3 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" or (MpCommon.IsSampled)(2000, false, true, true) ~= true) then
  return mp.CLEAN
end
return mp.INFECTED

