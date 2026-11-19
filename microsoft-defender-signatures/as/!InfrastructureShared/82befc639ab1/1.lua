-- Threat: !InfrastructureShared
-- Name: 82befc639ab1
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Ocikq.B")
  return mp.INFECTED
end
return mp.LOWFI
