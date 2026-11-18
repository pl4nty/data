-- Threat: !InfrastructureShared
-- Name: 81b398e9e183
-- Type: 21

if bm.GetSignatureMatchDuration() > 300000000 then
  return mp.CLEAN
end
return mp.INFECTED
