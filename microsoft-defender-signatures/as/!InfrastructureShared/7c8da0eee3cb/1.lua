-- Threat: !InfrastructureShared
-- Name: 7c8da0eee3cb
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.T")
  return mp.INFECTED
end
return mp.LOWFI
