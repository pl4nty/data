-- Threat: !InfrastructureShared
-- Name: 16d8df843fe48
-- Type: 21

if mp.HSTR_WEIGHT >= 31 then
  mp.set_mpattribute("PUA:Block:AMCleaner.E")
  return mp.INFECTED
end
return mp.LOWFI
