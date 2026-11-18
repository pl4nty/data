-- Threat: !InfrastructureShared
-- Name: 618d4c279697
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.M")
  return mp.INFECTED
end
return mp.LOWFI
