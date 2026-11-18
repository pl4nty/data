-- Threat: !InfrastructureShared
-- Name: ba8ce43b8556
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:CoinMiner.BC")
  return mp.INFECTED
end
return mp.LOWFI
