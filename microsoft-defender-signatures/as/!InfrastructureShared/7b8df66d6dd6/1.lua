-- Threat: !InfrastructureShared
-- Name: 7b8df66d6dd6
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.X")
  return mp.INFECTED
end
return mp.LOWFI
