-- Threat: !InfrastructureShared
-- Name: 137843f3e4da
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
