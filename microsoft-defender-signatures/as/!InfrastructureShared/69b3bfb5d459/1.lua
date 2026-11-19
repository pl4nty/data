-- Threat: !InfrastructureShared
-- Name: 69b3bfb5d459
-- Type: 21

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
return mp.INFECTED
