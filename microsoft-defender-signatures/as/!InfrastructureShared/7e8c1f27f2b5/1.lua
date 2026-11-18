-- Threat: !InfrastructureShared
-- Name: 7e8c1f27f2b5
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:CGMiner.P")
  return mp.INFECTED
end
return mp.LOWFI
