-- Threat: !InfrastructureShared
-- Name: ae8d7bf57cce
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Shopsmart.A")
  return mp.INFECTED
end
return mp.LOWFI
