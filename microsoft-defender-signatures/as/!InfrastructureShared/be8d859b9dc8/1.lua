-- Threat: !InfrastructureShared
-- Name: be8d859b9dc8
-- Type: 21

if mp.HSTR_WEIGHT >= 11 then
  mp.set_mpattribute("PUA:Block:AMCleaner.N")
  return mp.INFECTED
end
return mp.LOWFI
