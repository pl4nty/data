-- Threat: !InfrastructureShared
-- Name: c48da40626ad
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Adload.C!xp")
  return mp.INFECTED
end
return mp.LOWFI
