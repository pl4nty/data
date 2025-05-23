-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9eb36649dd4b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = IsDetectionThresholdMet("BM")
if l_0_0 then
  return mp.INFECTED
end
add_parents()
reportRelatedBmHits()
addOverallNetworkVolume()
reportSessionInformation()
return mp.CLEAN

