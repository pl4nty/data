-- Threat: !InfrastructureShared
-- Name: b1b3e3da035c
-- Type: 21

if bm.GetSignatureMatchDuration() > 12000000000 then
  return mp.CLEAN
end
return mp.INFECTED
