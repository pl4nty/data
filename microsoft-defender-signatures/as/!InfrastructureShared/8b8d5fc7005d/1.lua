-- Threat: !InfrastructureShared
-- Name: 8b8d5fc7005d
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:InstallMiez.A")
  return mp.INFECTED
end
return mp.LOWFI
