-- Threat: !InfrastructureShared
-- Name: 1708d62f8aa6a
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:Adload.A!xp")
  return mp.INFECTED
end
return mp.LOWFI
