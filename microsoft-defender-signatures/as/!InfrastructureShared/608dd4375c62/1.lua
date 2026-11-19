-- Threat: !InfrastructureShared
-- Name: 608dd4375c62
-- Type: 21

if mp.HSTR_WEIGHT >= 12 then
  mp.set_mpattribute("PUA:Block:Shopsmart.D")
  return mp.INFECTED
end
return mp.LOWFI
