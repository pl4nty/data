-- Threat: !InfrastructureShared
-- Name: 1c48d300ce88d
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Adload.B!xp")
  return mp.INFECTED
end
return mp.LOWFI
