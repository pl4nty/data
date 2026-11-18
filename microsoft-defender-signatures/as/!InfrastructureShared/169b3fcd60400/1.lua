-- Threat: !InfrastructureShared
-- Name: 169b3fcd60400
-- Type: 21

if bm.GetSignatureMatchDuration() > 20000000 then
  return mp.CLEAN
end
return mp.INFECTED
