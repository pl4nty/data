-- Threat: !InfrastructureShared
-- Name: 2b7862a7025e
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
