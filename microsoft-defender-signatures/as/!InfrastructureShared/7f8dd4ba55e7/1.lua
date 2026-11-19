-- Threat: !InfrastructureShared
-- Name: 7f8dd4ba55e7
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Genieo.N!xp")
  return mp.INFECTED
end
return mp.LOWFI
