-- Threat: !InfrastructureShared
-- Name: 8f8d7fbe4bbb
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:AMCleaner.K")
  return mp.INFECTED
end
return mp.LOWFI
