-- Threat: !InfrastructureShared
-- Name: 1488d4aa81758
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.G!xp")
  return mp.INFECTED
end
return mp.LOWFI
