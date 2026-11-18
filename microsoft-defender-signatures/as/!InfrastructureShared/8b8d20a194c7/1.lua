-- Threat: !InfrastructureShared
-- Name: 8b8d20a194c7
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:InstallMiez")
  return mp.INFECTED
end
return mp.LOWFI
