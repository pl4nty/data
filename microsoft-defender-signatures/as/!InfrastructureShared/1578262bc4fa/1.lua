-- Threat: !InfrastructureShared
-- Name: 1578262bc4fa
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
