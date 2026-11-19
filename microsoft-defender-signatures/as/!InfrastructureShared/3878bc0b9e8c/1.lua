-- Threat: !InfrastructureShared
-- Name: 3878bc0b9e8c
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
