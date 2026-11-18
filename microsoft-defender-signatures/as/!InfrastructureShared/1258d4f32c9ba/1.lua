-- Threat: !InfrastructureShared
-- Name: 1258d4f32c9ba
-- Type: 21

if mp.HSTR_WEIGHT >= 8 then
  mp.set_mpattribute("PUA:Block:Genieo.T!xp")
  return mp.INFECTED
end
return mp.LOWFI
