-- Threat: !InfrastructureShared
-- Name: 968d984b8bda
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:VSearch.I")
  return mp.INFECTED
end
return mp.LOWFI
