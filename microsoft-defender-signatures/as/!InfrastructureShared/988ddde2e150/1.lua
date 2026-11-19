-- Threat: !InfrastructureShared
-- Name: 988ddde2e150
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:InstallMiez.F")
  return mp.INFECTED
end
return mp.LOWFI
