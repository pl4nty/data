-- Threat: !InfrastructureShared
-- Name: c48dc26b0455
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:CoinMiner.BG")
  return mp.INFECTED
end
return mp.LOWFI
