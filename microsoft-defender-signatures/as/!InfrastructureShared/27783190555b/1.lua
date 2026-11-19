-- Threat: !InfrastructureShared
-- Name: 27783190555b
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
