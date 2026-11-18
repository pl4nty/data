-- Threat: !InfrastructureShared
-- Name: 2a78e8a0c69b
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
