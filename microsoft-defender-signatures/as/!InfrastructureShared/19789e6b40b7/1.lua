-- Threat: !InfrastructureShared
-- Name: 19789e6b40b7
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
