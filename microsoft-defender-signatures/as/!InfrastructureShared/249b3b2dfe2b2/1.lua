-- Threat: !InfrastructureShared
-- Name: 249b3b2dfe2b2
-- Type: 21

if bm.GetSignatureMatchDuration() > 10000000 then
  return mp.CLEAN
end
return mp.INFECTED
