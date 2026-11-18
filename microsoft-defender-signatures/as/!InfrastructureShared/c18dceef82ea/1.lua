-- Threat: !InfrastructureShared
-- Name: c18dceef82ea
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Coinminer.D")
  return mp.INFECTED
end
return mp.LOWFI
