-- Threat: !InfrastructureShared
-- Name: f08d9d7e91bc
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:InstallMiez.D")
  return mp.INFECTED
end
return mp.LOWFI
