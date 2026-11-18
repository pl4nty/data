-- Threat: !InfrastructureShared
-- Name: 9c8c503356ba
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:CoinMiner.CD")
  return mp.INFECTED
end
return mp.LOWFI
