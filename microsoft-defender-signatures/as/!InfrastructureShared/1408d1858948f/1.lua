-- Threat: !InfrastructureShared
-- Name: 1408d1858948f
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.K!xp")
  return mp.INFECTED
end
return mp.LOWFI
