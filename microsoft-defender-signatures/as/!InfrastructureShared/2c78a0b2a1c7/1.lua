-- Threat: !InfrastructureShared
-- Name: 2c78a0b2a1c7
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
