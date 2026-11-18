-- Threat: !InfrastructureShared
-- Name: 2b78305480c3
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
