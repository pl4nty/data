-- Threat: !InfrastructureShared
-- Name: 15b8d2e80b128
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:AMCleaner.T")
  return mp.INFECTED
end
return mp.LOWFI
