-- Threat: !InfrastructureShared
-- Name: 678dda7ab12d
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:VSearch.H")
  return mp.INFECTED
end
return mp.LOWFI
