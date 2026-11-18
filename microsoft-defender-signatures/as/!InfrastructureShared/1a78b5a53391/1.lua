-- Threat: !InfrastructureShared
-- Name: 1a78b5a53391
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
