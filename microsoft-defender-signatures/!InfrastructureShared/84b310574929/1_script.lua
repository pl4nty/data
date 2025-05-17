-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b310574929\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = 3000000000
if l_0_0 < (bm.GetSignatureMatchDuration)() then
  return mp.CLEAN
end
add_parents()
reportRelatedBmHits()
addOverallNetworkVolume()
reportSessionInformation()
return mp.INFECTED

