-- Threat: !InfrastructureShared
-- Name: 1e789f779c9c
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
