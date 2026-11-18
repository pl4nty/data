-- Threat: !InfrastructureShared
-- Name: 2b78e55d6eac
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
