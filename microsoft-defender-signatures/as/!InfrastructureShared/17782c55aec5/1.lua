-- Threat: !InfrastructureShared
-- Name: 17782c55aec5
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
