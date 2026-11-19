-- Threat: !InfrastructureShared
-- Name: 247836f630a3
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
