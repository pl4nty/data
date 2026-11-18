-- Threat: !InfrastructureShared
-- Name: 688da9271e59
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:CoinMiner.K")
  return mp.INFECTED
end
return mp.LOWFI
