-- Threat: !InfrastructureShared
-- Name: 7c8d5ab98d24
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:CoinMiner.F")
  return mp.INFECTED
end
return mp.LOWFI
