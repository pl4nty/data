-- Threat: !InfrastructureShared
-- Name: 10c8db941bd80
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:VSearch.E!xp")
  return mp.INFECTED
end
return mp.LOWFI
