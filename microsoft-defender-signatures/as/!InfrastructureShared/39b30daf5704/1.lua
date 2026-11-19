-- Threat: !InfrastructureShared
-- Name: 39b30daf5704
-- Type: 21

if bm.GetSignatureMatchDuration() < 10000000 then
  return mp.INFECTED
end
return mp.CLEAN
