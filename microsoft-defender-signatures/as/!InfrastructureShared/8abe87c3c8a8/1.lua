-- Threat: !InfrastructureShared
-- Name: 8abe87c3c8a8
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Rootnik.A")
  return mp.INFECTED
end
return mp.LOWFI
