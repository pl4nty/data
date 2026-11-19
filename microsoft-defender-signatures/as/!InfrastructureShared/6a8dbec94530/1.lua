-- Threat: !InfrastructureShared
-- Name: 6a8dbec94530
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:CoinMiner.zg")
  return mp.INFECTED
end
return mp.LOWFI
