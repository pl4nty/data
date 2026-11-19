-- Threat: !InfrastructureShared
-- Name: 1df8da98373cb
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.Q!xp")
  return mp.INFECTED
end
return mp.LOWFI
