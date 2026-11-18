-- Threat: !InfrastructureShared
-- Name: 16782c8933fa
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
