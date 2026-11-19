-- Threat: !InfrastructureShared
-- Name: 297882df4a6f
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
