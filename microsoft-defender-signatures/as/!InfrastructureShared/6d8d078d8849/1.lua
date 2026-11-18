-- Threat: !InfrastructureShared
-- Name: 6d8d078d8849
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Spigot.A")
  return mp.INFECTED
end
return mp.LOWFI
