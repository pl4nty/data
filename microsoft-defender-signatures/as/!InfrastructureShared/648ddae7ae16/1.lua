-- Threat: !InfrastructureShared
-- Name: 648ddae7ae16
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:BitCoinMiner.A")
  return mp.INFECTED
end
return mp.LOWFI
