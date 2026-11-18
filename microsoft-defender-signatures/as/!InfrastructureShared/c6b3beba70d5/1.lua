-- Threat: !InfrastructureShared
-- Name: c6b3beba70d5
-- Type: 21

if bm.GetSignatureMatchDuration() > 50000000 then
  return mp.CLEAN
end
return mp.INFECTED
