-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLinuxSuspFileCollectM\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "9d61afa0-cfa4-4746-95af-dc897a6f6774" and l_0_0:lower() ~= "73a99e52-c380-4b86-9d47-fe1cb231f222" then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true and (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

