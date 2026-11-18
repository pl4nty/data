-- Threat: !InfrastructureShared
-- Name: 5c789e5c5b7e
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
