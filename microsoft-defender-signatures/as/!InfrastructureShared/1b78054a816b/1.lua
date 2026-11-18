-- Threat: !InfrastructureShared
-- Name: 1b78054a816b
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
