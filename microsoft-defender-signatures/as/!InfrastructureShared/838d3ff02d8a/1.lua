-- Threat: !InfrastructureShared
-- Name: 838d3ff02d8a
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:CoinMiner.X")
  return mp.INFECTED
end
return mp.LOWFI
