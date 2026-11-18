-- Threat: !InfrastructureShared
-- Name: 1c7856a776d4
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
