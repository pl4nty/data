-- Threat: !InfrastructureShared
-- Name: 26784050f2b1
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
