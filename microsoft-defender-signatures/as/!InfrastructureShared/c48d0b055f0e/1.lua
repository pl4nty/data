-- Threat: !InfrastructureShared
-- Name: c48d0b055f0e
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:AMCleaner.C")
  return mp.INFECTED
end
return mp.LOWFI
