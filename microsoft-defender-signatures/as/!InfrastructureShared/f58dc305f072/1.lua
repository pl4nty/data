-- Threat: !InfrastructureShared
-- Name: f58dc305f072
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:VSearch.E")
  return mp.INFECTED
end
return mp.LOWFI
