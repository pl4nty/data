-- Threat: !InfrastructureShared
-- Name: 75b3f899079e
-- Type: 21

if bm.GetSignatureMatchDuration() > 300000000 then
  return mp.CLEAN
end
return mp.INFECTED
