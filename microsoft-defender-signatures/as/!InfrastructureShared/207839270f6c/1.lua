-- Threat: !InfrastructureShared
-- Name: 207839270f6c
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
