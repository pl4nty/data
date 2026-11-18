-- Threat: !InfrastructureShared
-- Name: 2448dc628f42a
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Genieo.B!xp")
  return mp.INFECTED
end
return mp.LOWFI
