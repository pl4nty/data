-- Threat: !InfrastructureShared
-- Name: 16785182b1ee
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
