-- Threat: !InfrastructureShared
-- Name: 1c78c683595f
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
