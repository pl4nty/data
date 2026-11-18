-- Threat: !InfrastructureShared
-- Name: 788dbe33be90
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.F!xp")
  return mp.INFECTED
end
return mp.LOWFI
