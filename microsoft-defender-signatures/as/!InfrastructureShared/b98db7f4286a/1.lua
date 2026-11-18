-- Threat: !InfrastructureShared
-- Name: b98db7f4286a
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.N")
  return mp.INFECTED
end
return mp.LOWFI
