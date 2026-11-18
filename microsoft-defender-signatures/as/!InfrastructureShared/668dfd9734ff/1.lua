-- Threat: !InfrastructureShared
-- Name: 668dfd9734ff
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.V!xp")
  return mp.INFECTED
end
return mp.LOWFI
