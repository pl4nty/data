-- Threat: !InfrastructureShared
-- Name: 18789d916c9d
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
