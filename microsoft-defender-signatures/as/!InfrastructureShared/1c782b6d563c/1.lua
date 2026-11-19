-- Threat: !InfrastructureShared
-- Name: 1c782b6d563c
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
