-- Threat: !InfrastructureShared
-- Name: 84b341095872
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = 3000000000
if l_0_0 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
add_parents()
reportRelatedBmHits()
addOverallNetworkVolume()
reportSessionInformation()
return mp.INFECTED
