-- Threat: !InfrastructureShared
-- Name: 1738d607bb4ee
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:AMCleaner.H")
  return mp.INFECTED
end
return mp.LOWFI
