-- Threat: !InfrastructureShared
-- Name: c28dcf4e7976
-- Type: 21

if mp.HSTR_WEIGHT >= 12 then
  mp.set_mpattribute("PUA:Block:Spigot.D")
  return mp.INFECTED
end
return mp.LOWFI
