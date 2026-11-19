-- Threat: !InfrastructureShared
-- Name: 1c78a044d2ca
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
