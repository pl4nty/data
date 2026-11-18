-- Threat: !InfrastructureShared
-- Name: 81b333bc8053
-- Type: 21

if bm.GetSignatureMatchDuration() > 12000000000 then
  return mp.CLEAN
end
return mp.INFECTED
