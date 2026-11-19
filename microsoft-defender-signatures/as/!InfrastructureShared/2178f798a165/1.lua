-- Threat: !InfrastructureShared
-- Name: 2178f798a165
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
