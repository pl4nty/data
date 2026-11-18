-- Threat: !InfrastructureShared
-- Name: 908dd7687532
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.AC")
  return mp.INFECTED
end
return mp.LOWFI
