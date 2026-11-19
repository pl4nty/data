-- Threat: !InfrastructureShared
-- Name: c78d6704f25f
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.TA")
  return mp.INFECTED
end
return mp.LOWFI
