-- Threat: !InfrastructureShared
-- Name: b98dd86fb76c
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:InstallMiez.C")
  return mp.INFECTED
end
return mp.LOWFI
