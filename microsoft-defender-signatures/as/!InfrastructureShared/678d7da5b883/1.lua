-- Threat: !InfrastructureShared
-- Name: 678d7da5b883
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:MacSearch.C")
  return mp.INFECTED
end
return mp.LOWFI
