-- Threat: !InfrastructureShared
-- Name: 1a7825243d83
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
