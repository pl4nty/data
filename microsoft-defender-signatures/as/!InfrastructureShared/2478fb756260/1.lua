-- Threat: !InfrastructureShared
-- Name: 2478fb756260
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
