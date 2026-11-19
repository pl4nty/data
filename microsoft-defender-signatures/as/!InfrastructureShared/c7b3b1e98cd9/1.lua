-- Threat: !InfrastructureShared
-- Name: c7b3b1e98cd9
-- Type: 21

if bm.GetSignatureMatchDuration() > 300000000 then
  return mp.CLEAN
end
return mp.INFECTED
