-- Threat: !InfrastructureShared
-- Name: 818df3ef75e0
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.R!xp")
  return mp.INFECTED
end
return mp.LOWFI
