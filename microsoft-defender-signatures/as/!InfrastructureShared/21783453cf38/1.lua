-- Threat: !InfrastructureShared
-- Name: 21783453cf38
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
