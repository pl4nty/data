-- Threat: !InfrastructureShared
-- Name: 25780f89ef35
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
