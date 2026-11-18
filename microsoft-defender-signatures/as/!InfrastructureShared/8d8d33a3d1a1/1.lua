-- Threat: !InfrastructureShared
-- Name: 8d8d33a3d1a1
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Sniper.A")
  return mp.INFECTED
end
return mp.LOWFI
