-- Threat: !InfrastructureShared
-- Name: 1578a2d123fa
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
