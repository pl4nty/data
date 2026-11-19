-- Threat: !InfrastructureShared
-- Name: a88dd3c1a302
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:CoinMiner.Y")
  return mp.INFECTED
end
return mp.LOWFI
