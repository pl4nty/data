-- Threat: !InfrastructureShared
-- Name: 1578dccf45a6
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
