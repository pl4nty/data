-- Threat: !InfrastructureShared
-- Name: 157846fe1ab0
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
