-- Threat: !InfrastructureShared
-- Name: 15f8dd3f3b6dc
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.C!xp")
  return mp.INFECTED
end
return mp.LOWFI
