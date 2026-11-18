-- Threat: !InfrastructureShared
-- Name: 868debff28ff
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Spigot.H")
  return mp.INFECTED
end
return mp.LOWFI
