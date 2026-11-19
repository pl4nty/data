-- Threat: !InfrastructureShared
-- Name: 1a784d153db3
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
