-- Threat: !InfrastructureShared
-- Name: ce8dd9ff44ff
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Bundlore.C!xp")
  return mp.INFECTED
end
return mp.LOWFI
