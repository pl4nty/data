-- Threat: !InfrastructureShared
-- Name: 818d3566ed3d
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:Spigot.B")
  return mp.INFECTED
end
return mp.LOWFI
