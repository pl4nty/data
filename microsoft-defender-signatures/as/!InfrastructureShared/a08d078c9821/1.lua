-- Threat: !InfrastructureShared
-- Name: a08d078c9821
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:Coinminer.C")
  return mp.INFECTED
end
return mp.LOWFI
