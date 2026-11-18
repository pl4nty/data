-- Threat: !InfrastructureShared
-- Name: bb8da37bf3c7
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.H!xp")
  return mp.INFECTED
end
return mp.LOWFI
