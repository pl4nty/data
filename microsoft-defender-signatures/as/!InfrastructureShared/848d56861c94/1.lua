-- Threat: !InfrastructureShared
-- Name: 848d56861c94
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.O!xp")
  return mp.INFECTED
end
return mp.LOWFI
