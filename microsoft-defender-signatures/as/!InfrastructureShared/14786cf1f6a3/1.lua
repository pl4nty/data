-- Threat: !InfrastructureShared
-- Name: 14786cf1f6a3
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
