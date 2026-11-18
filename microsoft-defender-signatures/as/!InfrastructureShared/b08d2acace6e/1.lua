-- Threat: !InfrastructureShared
-- Name: b08d2acace6e
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:Ethereum")
  return mp.INFECTED
end
return mp.LOWFI
