-- Threat: !InfrastructureShared
-- Name: 1478800e3960
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
