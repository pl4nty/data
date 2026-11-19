-- Threat: !InfrastructureShared
-- Name: a98dce394eb4
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Shopsmart.F")
  return mp.INFECTED
end
return mp.LOWFI
