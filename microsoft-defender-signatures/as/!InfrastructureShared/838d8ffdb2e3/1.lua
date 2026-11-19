-- Threat: !InfrastructureShared
-- Name: 838d8ffdb2e3
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:AMCleaner.O")
  return mp.INFECTED
end
return mp.LOWFI
