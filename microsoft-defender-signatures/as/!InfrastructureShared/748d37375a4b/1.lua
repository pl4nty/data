-- Threat: !InfrastructureShared
-- Name: 748d37375a4b
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Ethereum.S")
  return mp.INFECTED
end
return mp.LOWFI
