-- Threat: !InfrastructureShared
-- Name: 8a8d64e043fc
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Spigot.F")
  return mp.INFECTED
end
return mp.LOWFI
