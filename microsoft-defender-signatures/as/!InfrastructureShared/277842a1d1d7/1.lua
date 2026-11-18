-- Threat: !InfrastructureShared
-- Name: 277842a1d1d7
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
