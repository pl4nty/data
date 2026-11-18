-- Threat: !InfrastructureShared
-- Name: 1b78e5df8171
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
