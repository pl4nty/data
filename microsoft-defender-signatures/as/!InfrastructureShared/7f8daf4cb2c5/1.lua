-- Threat: !InfrastructureShared
-- Name: 7f8daf4cb2c5
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.U!xp")
  return mp.INFECTED
end
return mp.LOWFI
