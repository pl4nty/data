-- Threat: !InfrastructureShared
-- Name: ad8d0dae3fb9
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:Miner.E")
  return mp.INFECTED
end
return mp.LOWFI
