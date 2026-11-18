-- Threat: !InfrastructureShared
-- Name: 968d2e98a674
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Spigot.G")
  return mp.INFECTED
end
return mp.LOWFI
