-- Threat: !InfrastructureShared
-- Name: 16787e1a67d0
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
