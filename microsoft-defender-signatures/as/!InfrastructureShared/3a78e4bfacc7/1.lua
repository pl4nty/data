-- Threat: !InfrastructureShared
-- Name: 3a78e4bfacc7
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
