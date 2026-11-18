-- Threat: !InfrastructureShared
-- Name: 8b8d8fe3050c
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:MacSearch.D")
  return mp.INFECTED
end
return mp.LOWFI
