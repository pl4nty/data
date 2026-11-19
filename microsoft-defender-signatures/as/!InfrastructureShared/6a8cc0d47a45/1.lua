-- Threat: !InfrastructureShared
-- Name: 6a8cc0d47a45
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:CoinMiner.CA")
  return mp.INFECTED
end
return mp.LOWFI
