-- Threat: !InfrastructureShared
-- Name: 35780c013188
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
