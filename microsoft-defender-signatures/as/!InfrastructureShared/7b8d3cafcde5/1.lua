-- Threat: !InfrastructureShared
-- Name: 7b8d3cafcde5
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.D!xp")
  return mp.INFECTED
end
return mp.LOWFI
