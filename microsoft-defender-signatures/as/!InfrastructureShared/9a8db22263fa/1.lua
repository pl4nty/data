-- Threat: !InfrastructureShared
-- Name: 9a8db22263fa
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Bundlore.A!xp")
  return mp.INFECTED
end
return mp.LOWFI
