-- Threat: !InfrastructureShared
-- Name: 39b343d090ff
-- Type: 21

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
return mp.INFECTED
