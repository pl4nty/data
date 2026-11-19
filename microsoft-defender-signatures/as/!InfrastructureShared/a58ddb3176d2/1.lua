-- Threat: !InfrastructureShared
-- Name: a58ddb3176d2
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.V")
  return mp.INFECTED
end
return mp.LOWFI
