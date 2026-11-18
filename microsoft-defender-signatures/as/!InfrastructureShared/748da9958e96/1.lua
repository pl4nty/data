-- Threat: !InfrastructureShared
-- Name: 748da9958e96
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:MacOS/AMCleaner.ZM")
  return mp.INFECTED
end
return mp.LOWFI
