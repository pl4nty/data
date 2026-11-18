-- Threat: !InfrastructureShared
-- Name: 578dfeb5a0ee
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Didnarbois.C")
  return mp.INFECTED
end
return mp.LOWFI
