-- Threat: !InfrastructureShared
-- Name: 157800160cdd
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
