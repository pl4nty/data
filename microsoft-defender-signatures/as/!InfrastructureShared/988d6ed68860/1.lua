-- Threat: !InfrastructureShared
-- Name: 988d6ed68860
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.A!xp")
  return mp.INFECTED
end
return mp.LOWFI
