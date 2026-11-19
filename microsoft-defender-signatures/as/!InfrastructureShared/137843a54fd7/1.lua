-- Threat: !InfrastructureShared
-- Name: 137843a54fd7
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
