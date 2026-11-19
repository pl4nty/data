-- Threat: !InfrastructureShared
-- Name: 628d1522efac
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:CoinMiner.H")
  return mp.INFECTED
end
return mp.LOWFI
