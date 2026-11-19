-- Threat: !InfrastructureShared
-- Name: 72781fb2eec1
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
