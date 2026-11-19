-- Threat: !InfrastructureShared
-- Name: 808cfe908ec8
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:CoMiner.A")
  return mp.INFECTED
end
return mp.LOWFI
