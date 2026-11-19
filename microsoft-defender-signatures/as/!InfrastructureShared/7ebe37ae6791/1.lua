-- Threat: !InfrastructureShared
-- Name: 7ebe37ae6791
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Noicon.A")
  return mp.INFECTED
end
return mp.LOWFI
