-- Threat: !InfrastructureShared
-- Name: b48db3d9ea4a
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.A!xp")
  return mp.INFECTED
end
return mp.LOWFI
