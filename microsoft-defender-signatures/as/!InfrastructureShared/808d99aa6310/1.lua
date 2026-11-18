-- Threat: !InfrastructureShared
-- Name: 808d99aa6310
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.S")
  return mp.INFECTED
end
return mp.LOWFI
