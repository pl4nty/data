-- Threat: !InfrastructureShared
-- Name: 1478bfc10c87
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
