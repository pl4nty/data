-- Threat: !InfrastructureShared
-- Name: acbedd335760
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Resharer.B")
  return mp.INFECTED
end
return mp.LOWFI
