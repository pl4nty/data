-- Threat: !InfrastructureShared
-- Name: 167802525620
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
