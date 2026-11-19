-- Threat: !InfrastructureShared
-- Name: d88de5fd2fd8
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Bundlore.I!xp")
  return mp.INFECTED
end
return mp.LOWFI
