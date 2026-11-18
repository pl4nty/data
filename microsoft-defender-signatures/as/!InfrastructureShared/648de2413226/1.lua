-- Threat: !InfrastructureShared
-- Name: 648de2413226
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:CoinMiner.I")
  return mp.INFECTED
end
return mp.LOWFI
