-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAArchiveWithMotw\1.luac 

-- params : ...
-- function num : 0
do
  if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true and (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true then
    local l_0_0 = (mp.GetMOTWZone)()
    if l_0_0 and l_0_0 >= 3 then
      (mp.set_mpattribute)("//LUA:ArchiveWithMotw")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

