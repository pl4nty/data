-- Threat: !InfrastructureShared
-- Name: e68d6c4cb384
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:VSearch.C!xp")
  return mp.INFECTED
end
return mp.LOWFI
