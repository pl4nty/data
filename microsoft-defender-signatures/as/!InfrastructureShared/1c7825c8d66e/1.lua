-- Threat: !InfrastructureShared
-- Name: 1c7825c8d66e
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
