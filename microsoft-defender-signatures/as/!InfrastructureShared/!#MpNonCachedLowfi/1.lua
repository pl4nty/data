-- Threat: !InfrastructureShared
-- Name: !#MpNonCachedLowfi
-- Type: 12

local l_0_0 = mp.GetScanSource()
if l_0_0 == mp.SCANSOURCE_UCL then
  return mp.INFECTED
end
return mp.CLEAN
