-- Threat: !InfrastructureShared
-- Name: 9d8d9ccb5e50
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:FPlayer.C")
  return mp.INFECTED
end
return mp.LOWFI
