-- Threat: !InfrastructureShared
-- Name: 16789cef2541
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
