-- Threat: !InfrastructureShared
-- Name: 718d9cc06967
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Spigot.C")
  return mp.INFECTED
end
return mp.LOWFI
