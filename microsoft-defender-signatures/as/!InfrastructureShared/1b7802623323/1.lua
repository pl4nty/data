-- Threat: !InfrastructureShared
-- Name: 1b7802623323
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
