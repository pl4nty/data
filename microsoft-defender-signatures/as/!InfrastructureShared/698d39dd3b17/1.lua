-- Threat: !InfrastructureShared
-- Name: 698d39dd3b17
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.J")
  return mp.INFECTED
end
return mp.LOWFI
