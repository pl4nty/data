-- Threat: !InfrastructureShared
-- Name: 69b3dbcb11ec
-- Type: 21

if bm.GetSignatureMatchDuration() > 50000000 then
  return mp.CLEAN
end
return mp.INFECTED
