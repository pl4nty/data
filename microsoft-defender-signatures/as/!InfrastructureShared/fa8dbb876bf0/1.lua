-- Threat: !InfrastructureShared
-- Name: fa8dbb876bf0
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:VSearch.B!xp")
  return mp.INFECTED
end
return mp.LOWFI
