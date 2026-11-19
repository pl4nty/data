-- Threat: !InfrastructureShared
-- Name: 26789b17a14a
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
