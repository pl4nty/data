-- Threat: !InfrastructureShared
-- Name: 9f8d5a431923
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.R")
  return mp.INFECTED
end
return mp.LOWFI
