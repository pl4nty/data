-- Threat: !InfrastructureShared
-- Name: 1f787e6d78ab
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
