-- Threat: !InfrastructureShared
-- Name: 1778a554ea7e
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
