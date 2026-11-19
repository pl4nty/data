-- Threat: !InfrastructureShared
-- Name: 157817b10025
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
