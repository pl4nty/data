-- Threat: !InfrastructureShared
-- Name: 448d0f957e2d
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:CoinMiner.B")
  return mp.INFECTED
end
return mp.LOWFI
