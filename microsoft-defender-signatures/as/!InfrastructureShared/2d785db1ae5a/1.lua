-- Threat: !InfrastructureShared
-- Name: 2d785db1ae5a
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
