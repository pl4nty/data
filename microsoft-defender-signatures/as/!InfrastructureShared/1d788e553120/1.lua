-- Threat: !InfrastructureShared
-- Name: 1d788e553120
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
