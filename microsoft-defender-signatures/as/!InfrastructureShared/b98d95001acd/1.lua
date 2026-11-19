-- Threat: !InfrastructureShared
-- Name: b98d95001acd
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.U")
  return mp.INFECTED
end
return mp.LOWFI
