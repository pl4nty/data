-- Threat: !InfrastructureShared
-- Name: 13786c675682
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
