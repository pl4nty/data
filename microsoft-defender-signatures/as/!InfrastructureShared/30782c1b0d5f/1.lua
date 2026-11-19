-- Threat: !InfrastructureShared
-- Name: 30782c1b0d5f
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
