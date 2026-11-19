-- Threat: !InfrastructureShared
-- Name: 868d15ebd780
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:CoinMiner.M")
  return mp.INFECTED
end
return mp.LOWFI
