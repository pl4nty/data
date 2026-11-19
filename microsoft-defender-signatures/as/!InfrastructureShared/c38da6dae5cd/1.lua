-- Threat: !InfrastructureShared
-- Name: c38da6dae5cd
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:InstallMiez.E")
  return mp.INFECTED
end
return mp.LOWFI
