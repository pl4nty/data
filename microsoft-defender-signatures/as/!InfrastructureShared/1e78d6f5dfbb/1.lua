-- Threat: !InfrastructureShared
-- Name: 1e78d6f5dfbb
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
