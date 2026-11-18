-- Threat: !InfrastructureShared
-- Name: 19787ff758ec
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
