-- Threat: !InfrastructureShared
-- Name: 2578a42d5412
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
