-- Threat: !InfrastructureShared
-- Name: 1318d6a467dfb
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:AMCleaner.B")
  return mp.INFECTED
end
return mp.LOWFI
