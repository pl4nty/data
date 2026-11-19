-- Threat: !InfrastructureShared
-- Name: 1678be36c145
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
