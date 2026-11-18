-- Threat: !InfrastructureShared
-- Name: f18dd8ad167d
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.L")
  return mp.INFECTED
end
return mp.LOWFI
