-- Threat: !InfrastructureShared
-- Name: 27781e42f357
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
