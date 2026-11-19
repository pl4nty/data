-- Threat: !InfrastructureShared
-- Name: 858d87908750
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Genieo.I!xp")
  return mp.INFECTED
end
return mp.LOWFI
