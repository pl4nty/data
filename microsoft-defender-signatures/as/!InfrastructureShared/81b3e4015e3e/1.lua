-- Threat: !InfrastructureShared
-- Name: 81b3e4015e3e
-- Type: 21

if bm.GetSignatureMatchDuration() > 30000000 then
  return mp.CLEAN
end
return mp.INFECTED
