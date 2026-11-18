-- Threat: !InfrastructureShared
-- Name: 1d782ee6295d
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
