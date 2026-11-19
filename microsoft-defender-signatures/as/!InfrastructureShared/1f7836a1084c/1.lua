-- Threat: !InfrastructureShared
-- Name: 1f7836a1084c
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
