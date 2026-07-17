-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERCaptiveCrunchA!dha\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = (mp.GetMOTWReferrerUrl)()
  local l_0_1 = (mp.GetMOTWHostUrl)()
  if l_0_0 ~= nil and l_0_1 ~= nil and #l_0_1 >= 4 and l_0_0:find("www.msftconnecttest.com", 1, true) and (l_0_1:sub(-4) == ".exe" or l_0_1:sub(-4) == ".zip") then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

