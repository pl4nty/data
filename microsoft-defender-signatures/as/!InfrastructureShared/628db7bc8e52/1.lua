-- Threat: !InfrastructureShared
-- Name: 628db7bc8e52
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:SearchProxy.E")
  return mp.INFECTED
end
return mp.LOWFI
