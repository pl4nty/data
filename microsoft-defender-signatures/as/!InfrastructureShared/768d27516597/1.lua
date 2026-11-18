-- Threat: !InfrastructureShared
-- Name: 768d27516597
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:InstallCore.A")
  return mp.INFECTED
end
return mp.LOWFI
