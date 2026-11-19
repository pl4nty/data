-- Threat: !InfrastructureShared
-- Name: 2278b0c6b521
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
