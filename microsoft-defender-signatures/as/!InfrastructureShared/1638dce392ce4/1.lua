-- Threat: !InfrastructureShared
-- Name: 1638dce392ce4
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.B!xp")
  return mp.INFECTED
end
return mp.LOWFI
