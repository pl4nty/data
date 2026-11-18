-- Threat: !InfrastructureShared
-- Name: 12784fcaa78f
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
