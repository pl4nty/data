-- Threat: !InfrastructureShared
-- Name: 21784516a5ed
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
