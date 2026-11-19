-- Threat: !InfrastructureShared
-- Name: 518db1e67c97
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MacSearch.B")
  return mp.INFECTED
end
return mp.LOWFI
