-- Threat: !InfrastructureShared
-- Name: 207874c90727
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
