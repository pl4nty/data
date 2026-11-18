-- Threat: !InfrastructureShared
-- Name: 1b78568df9bc
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
