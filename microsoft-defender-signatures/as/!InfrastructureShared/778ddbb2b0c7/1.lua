-- Threat: !InfrastructureShared
-- Name: 778ddbb2b0c7
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:SpeedUpMac.A")
  return mp.INFECTED
end
return mp.LOWFI
