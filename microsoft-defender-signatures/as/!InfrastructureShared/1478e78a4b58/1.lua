-- Threat: !InfrastructureShared
-- Name: 1478e78a4b58
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
