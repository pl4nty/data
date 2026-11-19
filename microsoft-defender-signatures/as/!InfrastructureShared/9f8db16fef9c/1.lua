-- Threat: !InfrastructureShared
-- Name: 9f8db16fef9c
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:VSearch.B")
  return mp.INFECTED
end
return mp.LOWFI
