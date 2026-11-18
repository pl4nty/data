-- Threat: !InfrastructureShared
-- Name: 7d8dfb9dee8c
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.J!xp")
  return mp.INFECTED
end
return mp.LOWFI
