-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32PersistInStart\1.luac 

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
if l_0_1 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_1 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and l_0_1 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
if (string.find)(l_0_2, "attackiqpersistencethroughstartupfolderbinary", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

